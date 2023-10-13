import 'package:flutter/material.dart';
import 'package:zeus_breakout_rivival/element/base_class/gameObject.dart';

class Ball extends GameObject {
  late Offset direction;
  late double speed;

  Ball({required Offset position, required this.direction, required this.speed})
      : super(position: position, size: Size(.5, .5));

  @override
  Widget renderGameObject(Size unitSize) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(100), offset: Offset(10, 10))
          ]),
    );
  }
}