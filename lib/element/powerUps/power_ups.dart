import 'package:flutter/material.dart';
import 'package:zeus_breakout_rivival/element/base_class/gameObject.dart';


enum PowerUpType { length, balls, speed }

extension PowerUpProps on PowerUpType {
  Color get color {
    switch (this) {
      case PowerUpType.length:
        return Colors.blue;
      case PowerUpType.speed:
        return Colors.red;
      case PowerUpType.balls:
        return Colors.green;
    }
  }

  String get letter {
    switch (this) {
      case PowerUpType.length:
        return "L";
      case PowerUpType.speed:
        return "S";
      case PowerUpType.balls:
        return "B";
    }
  }
}

class PowerUp extends GameObject {
  final PowerUpType type;
  PowerUp({required Offset position, required this.type})
      : super(position: position, size: Size(2, 1));

  @override
  Widget renderGameObject(Size unitSize) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.lerp(type.color, Colors.black, .1)!,
                  Colors.grey.shade200,
                  type.color,
                  Color.lerp(type.color, Colors.black, .1)!,
                  Color.lerp(type.color, Colors.black, .2)!,
                ]),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(100), offset: Offset(10, 10))
            ],
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Center(
            child: Text(type.letter,
                style: TextStyle(
                    color: Colors.yellow.shade700,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    shadows: [Shadow(color: Colors.black, blurRadius: 3.0)]))));
  }
}