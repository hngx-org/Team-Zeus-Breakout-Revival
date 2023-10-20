import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:zeus_breakout_rivival/src/components/background_component.dart';
import 'package:zeus_breakout_rivival/src/components/paddle_component.dart';
import 'package:zeus_breakout_rivival/src/inputs/joystick.dart';

class BrickBreakerGame extends FlameGame with DragCallbacks {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
    add(PaddleComponent(joystick: joystick));
    add(joystick);
  }
}
