import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zeus_breakout_rivival/element/brick/brick.dart';
import 'package:zeus_breakout_rivival/element/powerUps/power_ups.dart';
// import 'package:fluttlog('');er/material.dart';

final breakoutProvider = Provider<BreakoutController>((ref) {
  return BreakoutController();
});

class BreakoutController extends ChangeNotifier {
  int stage = 0;
  void update() {
    stage++;
    notifyListeners();
  }
}

List<BreakoutLevel> gameLevels = [
  BreakoutLevel(
    bricks: [
      Brick(position: const Offset(2, 2), color: Colors.green),
      Brick(position: const Offset(4, 2), color: Colors.green),
      Brick(position: const Offset(6, 2), color: Colors.green),
      Brick(position: const Offset(10, 2), color: Colors.green),
      Brick(position: const Offset(12, 2), color: Colors.green),
      Brick(position: const Offset(14, 2), color: Colors.green),
      Brick(position: const Offset(2, 3), color: Colors.red),
      Brick(position: const Offset(4, 3), color: Colors.red),
      Brick(position: const Offset(6, 3), color: Colors.red),
      Brick(position: const Offset(10, 3), color: Colors.red),
      Brick(position: const Offset(12, 3), color: Colors.red),
      Brick(position: const Offset(14, 3), color: Colors.red),
      Brick(position: const Offset(2, 4), color: Colors.amber),
      Brick(position: const Offset(4, 4), color: Colors.amber),
      Brick(position: const Offset(6, 4), color: Colors.amber),
      Brick(position: const Offset(10, 4), color: Colors.amber),
      Brick(position: const Offset(12, 4), color: Colors.amber),
      Brick(position: const Offset(14, 4), color: Colors.amber)
    ],
    powerUps: [
      PowerUp(position: const Offset(4.0, 7.0), type: PowerUpType.balls),
      PowerUp(position: const Offset(10.0, 3), type: PowerUpType.length),
      PowerUp(position: const Offset(2.0, 4.0), type: PowerUpType.balls),
      PowerUp(position: const Offset(4.0, 2.0), type: PowerUpType.speed)
    ],
  ),
];

class BreakoutLevel {
  final List<Brick> bricks;
  final List<PowerUp> powerUps;

  BreakoutLevel({
    required this.bricks,
    required this.powerUps,
  });
}
