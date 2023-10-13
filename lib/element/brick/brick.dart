import 'package:flutter/material.dart';
import 'package:zeus_breakout_rivival/element/base_class/gameObject.dart';

class Brick extends GameObject {
  Color color;

  Brick({required Offset position, required this.color})
      : super(position: position, size: Size(2, 1));

  @override
  Widget renderGameObject(Size unitSize) {
    return CustomPaint(painter: BrickPainter(brickColor: color));
  }

  Widget drawShadow(Size unitSize) {
    return Positioned(
        top: position.dy * unitSize.height,
        left: position.dx * unitSize.width,
        width: size.width * unitSize.width,
        height: size.height * unitSize.height,
        child: (Container(
            width: size.width * unitSize.width,
            height: size.height * unitSize.height,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(100), offset: Offset(10, 10))
            ]))));
  }
}

Paint stroke = Paint()
  ..strokeWidth = 1
  ..color = Colors.black
  ..style = PaintingStyle.stroke;


class BrickPainter extends CustomPainter {
  final Color brickColor;
  final Paint main;
  final Paint light;
  final Paint dark;

  BrickPainter({required this.brickColor})
      : main = Paint()
    ..color = brickColor
    ..style = PaintingStyle.fill,
        light = Paint()
          ..color = Color.lerp(brickColor, Colors.white, .1)!
          ..style = PaintingStyle.fill,
        dark = Paint()
          ..color = Color.lerp(brickColor, Colors.black, .1)!
          ..style = PaintingStyle.fill;
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Rect inner = rect.deflate(3);
    canvas.drawRect(rect, main);
    canvas.drawPath(
        Path()
          ..moveTo(inner.left, inner.top)
          ..lineTo(rect.left, rect.top)
          ..lineTo(rect.right, rect.top)
          ..lineTo(inner.right, inner.top)
          ..lineTo(inner.left, inner.top),
        light);
    canvas.drawPath(
        Path()
          ..moveTo(inner.right, inner.top)
          ..lineTo(rect.right, rect.top)
          ..lineTo(rect.right, rect.bottom)
          ..lineTo(inner.right, inner.bottom)
          ..lineTo(inner.right, inner.top),
        dark);
    canvas.drawPath(
        Path()
          ..moveTo(inner.left, inner.bottom)
          ..lineTo(rect.left, rect.bottom)
          ..lineTo(rect.right, rect.bottom)
          ..lineTo(inner.right, inner.bottom)
          ..lineTo(inner.left, inner.bottom),
        dark);
    canvas.drawPath(
        Path()
          ..moveTo(inner.left, inner.top)
          ..lineTo(rect.left, rect.top)
          ..lineTo(rect.left, rect.bottom)
          ..lineTo(inner.left, inner.bottom)
          ..lineTo(inner.left, inner.top),
        dark);
    canvas.drawRect(rect, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}