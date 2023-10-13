import 'package:flutter/material.dart';

abstract class GameObject {

  Offset position;
  Size size;

  GameObject({
    required this.position,
    required this.size
  });

  Widget render(Animation<double> controller, Size unitSize) => AnimatedBuilder(
    animation: controller,
    builder: (context, child) => Positioned(
        top: position.dy * unitSize.height,
        left: position.dx * unitSize.width,
        width: size.width * unitSize.width,
        height: size.height * unitSize.height,
        child: renderGameObject(unitSize)),
  );

  Widget renderGameObject(Size unitSize);

  Rect get rect =>
      Rect.fromLTWH(position.dx, position.dy, size.width, size.height);

}