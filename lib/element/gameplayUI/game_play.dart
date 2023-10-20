import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zeus_breakout_rivival/element/ball/ball.dart';
import 'package:zeus_breakout_rivival/element/brick/brick.dart';
import 'package:zeus_breakout_rivival/element/gameplayUI/Breakout_Controller.dart';
import 'package:zeus_breakout_rivival/element/paddle/paddle.dart';
import 'package:zeus_breakout_rivival/element/powerUps/power_ups.dart';
import 'package:zeus_breakout_rivival/src/features/gameover/game_status.dart';
import 'package:zeus_breakout_rivival/utils/extension.dart';

class Breakout extends StatefulWidget {
  const Breakout({Key? key}) : super(key: key);

  @override
  State<Breakout> createState() => _BreakoutState();
}

class _BreakoutState extends State<Breakout>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = true;
  bool gameComplete = false;
  bool gameFail = false;

  late Size worldSize;
  late Paddle paddle;
  late List<Ball> balls;
  late List<Brick> bricks;
  late List<PowerUp> powerups;
  late List<BreakoutLevel> levels;
  int stage = 0;

  int prevTimeMS = 0;

  int score = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    levels = [
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
      BreakoutLevel(
        bricks: [
          Brick(
              position: const Offset(2, 2),
              color: const Color(0xFF001219)), // Rich Black
          Brick(
              position: const Offset(4, 2),
              color: const Color(0xFF005F73)), // Midnight Green
          Brick(
              position: const Offset(6, 2),
              color: const Color(0xFF0A9396)), // Dark Cyan
          Brick(
              position: const Offset(8, 2),
              color: const Color(0xFF94D2BD)), // Tiffany Blue
          Brick(
              position: const Offset(10, 2),
              color: const Color(0xFFE9D8A6)), // Vanilla
          Brick(
              position: const Offset(12, 2),
              color: const Color(0xFFEE9B00)), // Gamboge
          Brick(
              position: const Offset(14, 2),
              color: const Color(0xFFCA6702)), // Alloy Orange
          Brick(
              position: const Offset(2, 3),
              color: const Color(0xFFBB3E03)), // Rust
          Brick(
              position: const Offset(4, 3),
              color: const Color(0xFFAE2012)), // Rufous
          Brick(
              position: const Offset(6, 3),
              color: const Color(0xFF9B2226)), // Auburn
          // Add more bricks
          Brick(
              position: const Offset(8, 3),
              color: const Color(0xFF001219)), // Rich Black
          Brick(
              position: const Offset(10, 3),
              color: const Color(0xFF005F73)), // Midnight Green
          Brick(
              position: const Offset(12, 3),
              color: const Color(0xFF0A9396)), // Dark Cyan
          Brick(
              position: const Offset(14, 3),
              color: const Color(0xFF94D2BD)), // Tiffany Blue
          Brick(
              position: const Offset(2, 4),
              color: const Color(0xFFE9D8A6)), // Vanilla
          Brick(
              position: const Offset(4, 4),
              color: const Color(0xFFEE9B00)), // Gamboge
          Brick(
              position: const Offset(6, 4),
              color: const Color(0xFFCA6702)), // Alloy Orange
          Brick(
              position: const Offset(8, 4),
              color: const Color(0xFFBB3E03)), // Rust
          Brick(
              position: const Offset(10, 4),
              color: const Color(0xFFAE2012)), // Rufous
          Brick(
              position: const Offset(12, 4),
              color: const Color(0xFF9B2226)), // Auburn
          Brick(position: const Offset(14, 4), color: const Color(0xFF001219)),
          // Add more bricks as needed
        ],
        powerUps: [
          PowerUp(position: const Offset(10.0, 3), type: PowerUpType.length),
          PowerUp(position: const Offset(2.0, 4.0), type: PowerUpType.balls),
          PowerUp(position: const Offset(4.0, 2.0), type: PowerUpType.speed)
        ],
      ),
      BreakoutLevel(
        bricks: [
          Brick(
              position: const Offset(2, 2),
              color: const Color(0xFF001219)), // Rich Black
          Brick(
              position: const Offset(4, 2),
              color: const Color(0xFF005F73)), // Midnight Green
          Brick(
              position: const Offset(6, 2),
              color: const Color(0xFF0A9396)), // Dark Cyan
          Brick(
              position: const Offset(10, 2),
              color: const Color(0xFF94D2BD)), // Tiffany Blue
          Brick(
              position: const Offset(12, 2),
              color: const Color(0xFFEE9B00)), // Gamboge
          Brick(
              position: const Offset(14, 2),
              color: const Color(0xFFCA6702)), // Alloy Orange
          Brick(
              position: const Offset(2, 3),
              color: const Color(0xFFBB3E03)), // Rust
          Brick(
              position: const Offset(4, 3),
              color: const Color(0xFFAE2012)), // Rufous
          Brick(
              position: const Offset(6, 3),
              color: const Color(0xFF9B2226)), // Auburn
          Brick(
              position: const Offset(10, 3),
              color: const Color(0xFF005F73)), // Midnight Green
          Brick(
              position: const Offset(12, 3),
              color: const Color(0xFF0A9396)), // Dark Cyan
          Brick(
              position: const Offset(14, 3),
              color: const Color(0xFF94D2BD)), // Tiffany Blue
          Brick(
              position: const Offset(2, 4),
              color: const Color(0xFFE9D8A6)), // Vanilla
          Brick(
              position: const Offset(4, 4),
              color: const Color(0xFFEE9B00)), // Gamboge
          Brick(
              position: const Offset(6, 4),
              color: const Color(0xFFCA6702)), // Alloy Orange
          Brick(
              position: const Offset(10, 4),
              color: const Color(0xFFAE2012)), // Rufous
          Brick(
              position: const Offset(12, 4),
              color: const Color(0xFF9B2226)), // Auburn
          Brick(position: const Offset(14, 4), color: const Color(0xFF001219)),
          // Add more bricks as needed
        ],
        powerUps: [
          PowerUp(position: const Offset(2.0, 4.0), type: PowerUpType.balls),
          PowerUp(position: const Offset(4.0, 2.0), type: PowerUpType.speed)
        ],
      ),
      BreakoutLevel(
        bricks: [
          // Row 1
          Brick(
              position: const Offset(2, 2),
              color: const Color(0xFF001219)), // Rich Black
          Brick(
              position: const Offset(4, 2),
              color: const Color(0xFF005F73)), // Midnight Green
          Brick(
              position: const Offset(6, 2),
              color: const Color(0xFF0A9396)), // Dark Cyan
          Brick(
              position: const Offset(8, 2),
              color: const Color(0xFF94D2BD)), // Tiffany Blue
          Brick(
              position: const Offset(10, 2),
              color: const Color(0xFFE9D8A6)), // Vanilla
          Brick(
              position: const Offset(12, 2),
              color: const Color(0xFFEE9B00)), // Gamboge
          Brick(
              position: const Offset(14, 2),
              color: const Color(0xFFCA6702)), // Alloy Orange

          // Row 2
          Brick(
              position: const Offset(2, 3),
              color: const Color(0xFFBB3E03)), // Rust
          Brick(
              position: const Offset(4, 3),
              color: const Color(0xFFAE2012)), // Rufous
          Brick(
              position: const Offset(6, 3),
              color: const Color(0xFF9B2226)), // Auburn
          Brick(
              position: const Offset(8, 3),
              color: const Color(0xFF001219)), // Rich Black
          Brick(
              position: const Offset(10, 3),
              color: const Color(0xFF005F73)), // Midnight Green
          Brick(
              position: const Offset(12, 3),
              color: const Color(0xFF0A9396)), // Dark Cyan
          Brick(
              position: const Offset(14, 3),
              color: const Color(0xFF94D2BD)), // Tiffany Blue

          // Add more rows and columns with additional bricks
          // Row 3
          Brick(
              position: const Offset(2, 4),
              color: const Color(0xFFE9D8A6)), // Vanilla
          Brick(
              position: const Offset(4, 4),
              color: const Color(0xFFEE9B00)), // Gamboge
          Brick(
              position: const Offset(6, 4),
              color: const Color(0xFFCA6702)), // Alloy Orange
          Brick(
              position: const Offset(8, 4),
              color: const Color(0xFFBB3E03)), // Rust
          Brick(
              position: const Offset(10, 4),
              color: const Color(0xFFAE2012)), // Rufous
          Brick(
              position: const Offset(12, 4),
              color: const Color(0xFF9B2226)), // Auburn
          Brick(
              position: const Offset(14, 4),
              color: const Color(0xFF001219)), // Rich Black

          // Add more rows and columns with additional bricks as needed
        ],
        powerUps: [
          PowerUp(position: const Offset(4.0, 7.0), type: PowerUpType.balls),
          // Add more power-ups if needed
        ],
      )
    ];
    controller =
        AnimationController(vsync: this, duration: const Duration(days: 99));
    controller.addListener(update);
    worldSize = const Size(18.0, 28.0);
    paddle = Paddle(position: const Offset(9.0 - 3.0 / 2, 26.0));
    balls = [
      Ball(
        position: const Offset(8.3, 18),
        direction: Offset.fromDirection(-.9),
        speed: 9,
      ),
    ];
    bricks = levels[stage].bricks;

    powerups = [];

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        powerups.add(levels[stage].powerUps[0]);
      });
    })
        .then((value) => {
              Future.delayed(const Duration(seconds: 10), () {
                setState(() {
                  powerups.add(levels[stage].powerUps[1]);
                });
              })
            })
        .then((value) => {
              Future.delayed(const Duration(seconds: 15), () {
                setState(() {
                  powerups.add(levels[stage].powerUps[2]);
                });
              })
            })
        .then((value) => {
              Future.delayed(const Duration(seconds: 20), () {
                setState(() {
                  powerups.add(levels[stage].powerUps[3]);
                });
              })
            });

    prevTimeMS = DateTime.now().millisecondsSinceEpoch;

    controller.forward();
  }

  //Logic
  void update() {
    // ignore: unnecessary_brace_in_string_interps
    int currTimeMS = DateTime.now().millisecondsSinceEpoch;
    int deltaMS = currTimeMS - prevTimeMS;
    double deltaS = deltaMS / 1000.0;
    List<Brick> destroyedBricks = [];
    List<PowerUp> consumedPowerups = [];

    if (paddle.desiredLength > paddle.size.width) {
      double growthAmount = .5 * deltaS;
      paddle.size = Size(paddle.size.width + growthAmount, paddle.size.height);
      paddle.position =
          Offset(paddle.position.dx - growthAmount / 2, paddle.position.dy);
    }

    if (paddle.left && paddle.position.dx > 0) {
      paddle.position = Offset(
          paddle.position.dx - paddle.speed * deltaS, paddle.position.dy);
    }
    if (paddle.right &&
        paddle.position.dx + paddle.size.width < worldSize.width) {
      paddle.position = Offset(
          paddle.position.dx + paddle.speed * deltaS, paddle.position.dy);
    }

    Rect paddleRect = paddle.rect;

    for (PowerUp powerup in powerups) {
      powerup.position =
          Offset(powerup.position.dx, powerup.position.dy + 4.0 * deltaS);
      Rect powerupRect = powerup.rect;
      if (paddleRect.overlaps(powerupRect)) {
        consumedPowerups.add(powerup);
        switch (powerup.type) {
          case PowerUpType.length:
            paddle.desiredLength += 1.0;
            break;
          case PowerUpType.speed:
            paddle.speed += 2.0;
            break;
          case PowerUpType.balls:
            balls.add(Ball(
                position: Offset(paddle.position.dx + paddle.size.width * .5,
                    paddle.position.dy - 1.0),
                direction: Offset.fromDirection(-.5),
                speed: 8.0));
            break;
        }
      }
    }

    for (Ball ball in balls) {
      ball.position = ball.position + ball.direction * ball.speed * deltaS;
      if (ball.position.dx + ball.size.width > worldSize.width) {
        ball.position =
            Offset(worldSize.width - ball.size.width, ball.position.dy);
        ball.direction = Offset(-ball.direction.dx, ball.direction.dy);
        debugPrint("collision happed here on the right");
      }
      if (ball.position.dx < 0) {
        ball.position = Offset(0, ball.position.dy);
        ball.direction = Offset(-ball.direction.dx, ball.direction.dy);
        debugPrint("collision happed here on the left");
      }
      if (ball.position.dy < 0) {
        ball.position = Offset(ball.position.dx, 0);
        ball.direction = Offset(ball.direction.dx, -ball.direction.dy);
        debugPrint("collision happed here on the top");
      }

      if (ball.position.dy + ball.size.height > worldSize.height) {
        print(balls.length);

        List<Ball> ballsToRemove = balls.where((ball) {
          return ball.position.dy + ball.size.height > worldSize.height;
        }).toList();

        for (Ball ball in ballsToRemove) {
          balls.remove(ball);
        }

        if (balls.isEmpty) {
          debugPrint("Game Over");
          setState(() {
            gameFail = true;
          });
        }
      }

      Rect ballRect = ball.rect;
      if (paddleRect.overlaps(ballRect)) {
        Rect intersection = ballRect.intersect(paddleRect);
        if (intersection.height < intersection.width &&
            ball.position.dy < paddle.position.dy) {
          // debugPrint("yes it is located here dke");

          // ball is hitting the face of the paddle
          ball.position =
              Offset(ball.position.dx, ball.position.dy - intersection.height);
          double paddlePct =
              (ball.position.dx + ball.size.width / 2 - paddle.position.dx) /
                  paddle.size.width;
          double maxAngle = pi * .8;
          ball.direction =
              Offset.fromDirection(-maxAngle + maxAngle * paddlePct);
        } else if (ball.position.dx < paddle.position.dx) {
          ball.position =
              Offset(paddle.position.dx - ball.size.width, ball.position.dy);
          ball.direction =
              Offset(-ball.direction.dx.abs(), ball.direction.dy.abs());
        } else if (ballRect.right > paddleRect.right) {
          ball.position = Offset(paddle.position.dx, ball.position.dy);
          ball.direction =
              Offset(-ball.direction.dx.abs(), ball.direction.dy.abs());
        } else {
          ball.position = Offset(ball.position.dx, paddleRect.bottom);
          ball.direction = Offset(0, ball.direction.dy.abs());
          // debugPrint("yes it is located here");
        }
      }
      //
      for (Brick brick in bricks) {
        Rect brickRect = brick.rect;
        if (brickRect.overlaps(ballRect)) {
          score += 5;
          destroyedBricks.add(brick);
          Rect intersection = brickRect.intersect(ballRect);
          if (intersection.height > intersection.width) {
            ball.position = Offset(
                ball.position.dx - intersection.width * ball.direction.dx.sign,
                ball.position.dy);
            ball.direction = Offset(-ball.direction.dx, ball.direction.dy);
          } else {
            ball.position = Offset(
                ball.position.dx,
                ball.position.dy -
                    intersection.height * ball.direction.dy.sign);
            ball.direction = Offset(ball.direction.dx, -ball.direction.dy);
          }
          break;
        }
      }
    }

    if (destroyedBricks.isNotEmpty || consumedPowerups.isNotEmpty) {
      setState(() {
        for (Brick destroyedBrick in destroyedBricks) {
          bricks.remove(destroyedBrick);
        }
        for (PowerUp powerup in consumedPowerups) {
          powerups.remove(powerup);
        }
      });
    }

    if (bricks.isEmpty) {
      setState(() {
        gameComplete = true;
      });
    }

    prevTimeMS = currTimeMS;
  }

  bool isPaused = false;

  void resetGame() {
    setState(() {
      levels = [
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
        BreakoutLevel(
          bricks: [
            Brick(
                position: const Offset(2, 2),
                color: const Color(0xFF001219)), // Rich Black
            Brick(
                position: const Offset(4, 2),
                color: const Color(0xFF005F73)), // Midnight Green
            Brick(
                position: const Offset(6, 2),
                color: const Color(0xFF0A9396)), // Dark Cyan
            Brick(
                position: const Offset(8, 2),
                color: const Color(0xFF94D2BD)), // Tiffany Blue
            Brick(
                position: const Offset(10, 2),
                color: const Color(0xFFE9D8A6)), // Vanilla
            Brick(
                position: const Offset(12, 2),
                color: const Color(0xFFEE9B00)), // Gamboge
            Brick(
                position: const Offset(14, 2),
                color: const Color(0xFFCA6702)), // Alloy Orange
            Brick(
                position: const Offset(2, 3),
                color: const Color(0xFFBB3E03)), // Rust
            Brick(
                position: const Offset(4, 3),
                color: const Color(0xFFAE2012)), // Rufous
            Brick(
                position: const Offset(6, 3),
                color: const Color(0xFF9B2226)), // Auburn
            // Add more bricks
            Brick(
                position: const Offset(8, 3),
                color: const Color(0xFF001219)), // Rich Black
            Brick(
                position: const Offset(10, 3),
                color: const Color(0xFF005F73)), // Midnight Green
            Brick(
                position: const Offset(12, 3),
                color: const Color(0xFF0A9396)), // Dark Cyan
            Brick(
                position: const Offset(14, 3),
                color: const Color(0xFF94D2BD)), // Tiffany Blue
            Brick(
                position: const Offset(2, 4),
                color: const Color(0xFFE9D8A6)), // Vanilla
            Brick(
                position: const Offset(4, 4),
                color: const Color(0xFFEE9B00)), // Gamboge
            Brick(
                position: const Offset(6, 4),
                color: const Color(0xFFCA6702)), // Alloy Orange
            Brick(
                position: const Offset(8, 4),
                color: const Color(0xFFBB3E03)), // Rust
            Brick(
                position: const Offset(10, 4),
                color: const Color(0xFFAE2012)), // Rufous
            Brick(
                position: const Offset(12, 4),
                color: const Color(0xFF9B2226)), // Auburn
            Brick(
                position: const Offset(14, 4), color: const Color(0xFF001219)),
            // Add more bricks as needed
          ],
          powerUps: [
            PowerUp(position: const Offset(10.0, 3), type: PowerUpType.length),
            PowerUp(position: const Offset(2.0, 4.0), type: PowerUpType.balls),
            PowerUp(position: const Offset(4.0, 2.0), type: PowerUpType.speed)
          ],
        ),
        BreakoutLevel(
          bricks: [
            Brick(
                position: const Offset(2, 2),
                color: const Color(0xFF001219)), // Rich Black
            Brick(
                position: const Offset(4, 2),
                color: const Color(0xFF005F73)), // Midnight Green
            Brick(
                position: const Offset(6, 2),
                color: const Color(0xFF0A9396)), // Dark Cyan
            Brick(
                position: const Offset(10, 2),
                color: const Color(0xFF94D2BD)), // Tiffany Blue
            Brick(
                position: const Offset(12, 2),
                color: const Color(0xFFEE9B00)), // Gamboge
            Brick(
                position: const Offset(14, 2),
                color: const Color(0xFFCA6702)), // Alloy Orange
            Brick(
                position: const Offset(2, 3),
                color: const Color(0xFFBB3E03)), // Rust
            Brick(
                position: const Offset(4, 3),
                color: const Color(0xFFAE2012)), // Rufous
            Brick(
                position: const Offset(6, 3),
                color: const Color(0xFF9B2226)), // Auburn
            Brick(
                position: const Offset(10, 3),
                color: const Color(0xFF005F73)), // Midnight Green
            Brick(
                position: const Offset(12, 3),
                color: const Color(0xFF0A9396)), // Dark Cyan
            Brick(
                position: const Offset(14, 3),
                color: const Color(0xFF94D2BD)), // Tiffany Blue
            Brick(
                position: const Offset(2, 4),
                color: const Color(0xFFE9D8A6)), // Vanilla
            Brick(
                position: const Offset(4, 4),
                color: const Color(0xFFEE9B00)), // Gamboge
            Brick(
                position: const Offset(6, 4),
                color: const Color(0xFFCA6702)), // Alloy Orange
            Brick(
                position: const Offset(10, 4),
                color: const Color(0xFFAE2012)), // Rufous
            Brick(
                position: const Offset(12, 4),
                color: const Color(0xFF9B2226)), // Auburn
            Brick(
                position: const Offset(14, 4), color: const Color(0xFF001219)),
            // Add more bricks as needed
          ],
          powerUps: [
            PowerUp(position: const Offset(2.0, 4.0), type: PowerUpType.balls),
            PowerUp(position: const Offset(4.0, 2.0), type: PowerUpType.speed)
          ],
        ),
        BreakoutLevel(
          bricks: [
            // Row 1
            Brick(
                position: const Offset(2, 2),
                color: const Color(0xFF001219)), // Rich Black
            Brick(
                position: const Offset(4, 2),
                color: const Color(0xFF005F73)), // Midnight Green
            Brick(
                position: const Offset(6, 2),
                color: const Color(0xFF0A9396)), // Dark Cyan
            Brick(
                position: const Offset(8, 2),
                color: const Color(0xFF94D2BD)), // Tiffany Blue
            Brick(
                position: const Offset(10, 2),
                color: const Color(0xFFE9D8A6)), // Vanilla
            Brick(
                position: const Offset(12, 2),
                color: const Color(0xFFEE9B00)), // Gamboge
            Brick(
                position: const Offset(14, 2),
                color: const Color(0xFFCA6702)), // Alloy Orange

            // Row 2
            Brick(
                position: const Offset(2, 3),
                color: const Color(0xFFBB3E03)), // Rust
            Brick(
                position: const Offset(4, 3),
                color: const Color(0xFFAE2012)), // Rufous
            Brick(
                position: const Offset(6, 3),
                color: const Color(0xFF9B2226)), // Auburn
            Brick(
                position: const Offset(8, 3),
                color: const Color(0xFF001219)), // Rich Black
            Brick(
                position: const Offset(10, 3),
                color: const Color(0xFF005F73)), // Midnight Green
            Brick(
                position: const Offset(12, 3),
                color: const Color(0xFF0A9396)), // Dark Cyan
            Brick(
                position: const Offset(14, 3),
                color: const Color(0xFF94D2BD)), // Tiffany Blue

            // Add more rows and columns with additional bricks
            // Row 3
            Brick(
                position: const Offset(2, 4),
                color: const Color(0xFFE9D8A6)), // Vanilla
            Brick(
                position: const Offset(4, 4),
                color: const Color(0xFFEE9B00)), // Gamboge
            Brick(
                position: const Offset(6, 4),
                color: const Color(0xFFCA6702)), // Alloy Orange
            Brick(
                position: const Offset(8, 4),
                color: const Color(0xFFBB3E03)), // Rust
            Brick(
                position: const Offset(10, 4),
                color: const Color(0xFFAE2012)), // Rufous
            Brick(
                position: const Offset(12, 4),
                color: const Color(0xFF9B2226)), // Auburn
            Brick(
                position: const Offset(14, 4),
                color: const Color(0xFF001219)), // Rich Black

            // Add more rows and columns with additional bricks as needed
          ],
          powerUps: [
            PowerUp(position: const Offset(4.0, 7.0), type: PowerUpType.balls),
            // Add more power-ups if needed
          ],
        )
      ];
      gameComplete = false;
      gameFail = false;
      score = 0;
      worldSize = const Size(18.0, 28.0);
      paddle = Paddle(position: const Offset(9.0 - 3.0 / 2, 26.0));
      balls = [
        Ball(
          position: const Offset(8.3, 18),
          direction: Offset.fromDirection(-.9),
          speed: 9,
        ),
      ];
      bricks = levels[stage].bricks;
    });
    controller.reset(); // Reset the AnimationController
    controller.forward(); // Start the game animation
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //Gameplay UI
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF9C59FE),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/svg/game-bg.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.all(16),
                    height: size.height * 0.1,
                    color: Colors.white.withAlpha(100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'back_btn'.imageWithTap(onTap: () {
                          Navigator.of(context).pop();
                        }),
                        'score: $score'.textLarge(),
                        GestureDetector(
                          onTap: () {
                            !isPaused
                                ? setState(() {
                                    isPaused = true;
                                    controller.stop();
                                    update();
                                  })
                                : setState(() {
                                    isPaused = false;
                                    controller.forward();
                                    update();
                                  });
                          },
                          child: Container(
                            height: size.height * 0.1,
                            width: size.height * 0.05,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/svg/action-button.png'),
                              ),
                            ),
                            child: Icon(
                              !isPaused ? Icons.play_arrow : Icons.pause,
                              size: size.height * 0.04,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: size.width,
                      child: AspectRatio(
                        aspectRatio: worldSize.aspectRatio,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            Size unitSize = Size(
                                constraints.maxWidth / worldSize.width,
                                constraints.maxHeight / worldSize.height);
                            List<Widget> gameObjects = [];
                            gameObjects
                                .add(paddle.render(controller, unitSize));
                            gameObjects.addAll(balls
                                .map((b) => b.render(controller, unitSize)));
                            gameObjects.addAll(
                                bricks.map((b) => b.drawShadow(unitSize)));
                            gameObjects.addAll(bricks
                                .map((b) => b.render(controller, unitSize)));
                            gameObjects.addAll(powerups
                                .map((b) => b.render(controller, unitSize)));
                            return Stack(
                              children: gameObjects,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTapDown: (details) => paddle.left = true,
                          onTapCancel: () => paddle.left = false,
                          onTapUp: (details) => paddle.left = false,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              'elevated-button'.svgPicture,
                              const Positioned(
                                child: Icon(Icons.arrow_left, size: 50),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTapDown: (details) => paddle.right = true,
                          onTapCancel: () => paddle.right = false,
                          onTapUp: (details) => paddle.right = false,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              'elevated-button'.svgPicture,
                              const Positioned(
                                child: Icon(Icons.arrow_right, size: 50),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            gameComplete
                ? GameStatus(
                    gameComplete: gameComplete,
                    gameFail: gameFail,
                    score: score,
                    onTap: () {
                      setState(() {
                        stage = stage + 1;
                        gameComplete = false;
                        gameFail = false;
                        score = 0;
                      });
                    },
                  )
                : Container(),
            gameFail
                ? GameStatus(
                    gameComplete: gameComplete,
                    gameFail: gameFail,
                    score: score,
                    onTap: () {
                      resetGame();
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
