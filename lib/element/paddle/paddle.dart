import 'package:flutter/material.dart';
import 'package:zeus_breakout_rivival/element/base_class/gameObject.dart';

class Paddle extends GameObject {
  late double speed = 10;
  bool left = false;
  bool right = false;


  double desiredLength = 3.0;

  Paddle({required Offset position}) : super(position: position, size: Size(3.0, .7));

  @override
  Widget renderGameObject(Size unitSize) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.red.shade700,
                  Colors.red.shade300,
                  Colors.red.shade600,
                  Colors.red.shade800,
                ]),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(100), offset: Offset(10, 10))
            ]),
        child: Center(
          child: Container(
              width: (size.width * unitSize.width) * .7,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.shade700,
                      Colors.grey.shade300,
                      Colors.grey.shade600,
                      Colors.grey.shade800,
                      Colors.black,
                    ]),
              )),
        ));
  }
}