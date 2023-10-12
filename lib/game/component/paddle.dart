import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:zeus_breakout_rivival/src/constants/constants.dart';

class Paddle extends RectangleComponent with CollisionCallbacks, DragCallbacks {
  Paddle({required this.draggingPaddle})
      : super(
          size: Vector2(kPaddleWidth, kPaddleHeight),
          paint: Paint()..color = kPaddleColor,
        );

  final void Function(DragUpdateEvent event) draggingPaddle;

  @override
  Future<void> onLoad() async {
    final paddleHitbox = RectangleHitbox(
      size: size,
    );

    add(paddleHitbox);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    draggingPaddle(event);
    super.onDragUpdate(event);
  }
}
