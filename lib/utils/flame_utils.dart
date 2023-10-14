import 'package:flame_audio/flame_audio.dart';

class FlameUtils {
  static playBgmWithDelay(
    String audioFilePath, {
    double volume = 1.0,
    int delayMilliseconds = 300,
  }) {
    FlameAudio.bgm
        .play(
          audioFilePath,
          volume: volume,
        )
        .then(
          (value) => Future.delayed(
            Duration(milliseconds: delayMilliseconds),
            () {
              FlameAudio.bgm.stop();
            },
          ),
        );
  }
}
