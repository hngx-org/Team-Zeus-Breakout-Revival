import 'package:flame/components.dart';
import 'package:zeus_breakout_rivival/src/constants/globals.dart';
import 'package:zeus_breakout_rivival/src/game/brick_breaker_game.dart';

enum MovementState {
  idle,
  slideLeft,
  slideRight,
}

class PaddleComponent extends SpriteGroupComponent
    with HasGameRef<BrickBreakerGame> {
  final double _spriteHeight = 20.0;

  final double _speed = 500;
  late double _rightBound;
  late double _leftBound;

  JoystickComponent joystick;

  PaddleComponent({
    required this.joystick,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    Sprite paddle = await gameRef.loadSprite(Globals.paddleSprite);

    sprites = {
      MovementState.idle: paddle,
      MovementState.slideLeft: paddle,
      MovementState.slideRight: paddle,
    };

    // screen restrictions
    _rightBound = gameRef.size.x - _spriteHeight;
    _leftBound = 0;

    current = MovementState.idle;

    position = Vector2(gameRef.size.x / 2, gameRef.size.y - _spriteHeight / 2);
    height = _spriteHeight;
    width = _spriteHeight * 3;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (joystick.direction == JoystickDirection.idle) {
      current = MovementState.idle;
      return;
    }

    if (x >= _rightBound) {
      x = _rightBound - 1;
    }

    if (x <= _leftBound) {
      x = _leftBound + 1;
    }

    bool movingLeft = joystick.relativeDelta[0] < 0;

    if (movingLeft) {
      current = MovementState.slideLeft;
    } else {
      current = MovementState.slideRight;
    }

    position.add(Vector2(joystick.relativeDelta[0], 0) * _speed * dt);
  }
}
