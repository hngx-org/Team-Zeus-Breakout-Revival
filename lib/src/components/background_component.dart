import 'package:flame/components.dart';
import 'package:zeus_breakout_rivival/src/constants/globals.dart';
import 'package:zeus_breakout_rivival/src/game/brick_breaker_game.dart';

class BackgroundComponent extends SpriteComponent
    with HasGameRef<BrickBreakerGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.backgroundSprite);
    size = gameRef.size;
  }
}
