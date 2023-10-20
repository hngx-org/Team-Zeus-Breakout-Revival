import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zeus_breakout_rivival/utils/extension.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
    required this.isSettingOn,
    required this.displayLevels,
  });

  final ValueNotifier<bool> isSettingOn;
  final ValueNotifier<bool> displayLevels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white.withAlpha(50),
            ),
            child: !isSettingOn.value
                ? 'settings'.imageWithTap(
                    onTap: () => isSettingOn.value = !isSettingOn.value,
                  )
                : Column(
                    children: [
                      'settings'.imageWithTap(
                        onTap: () => isSettingOn.value = !isSettingOn.value,
                      ),
                      5.hi,
                      'mic_on'.imageWithTap(
                        onTap: () {
                          FlameAudio.bgm.play('brick-play.mp3');
                        },
                        isMainSound: true,
                      ),
                      5.hi,
                      'mic_off'.imageWithTap(onTap: () {
                        FlameAudio.bgm.stop();
                      }),
                      5.hi,
                      'info'.imageWithTap(onTap: () {}),
                    ],
                  ),
          ),
          InkWell(
            onTap: () => displayLevels.value = !displayLevels.value,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: ShapeDecoration(
                color: const Color(0xFF9F51FE),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(33),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 0,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Text(
                displayLevels.value ? "Close" : 'Level 01',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Text(
                '0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              5.wi,
              'coin'
                  .svgPicture
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(delay: 500.ms, duration: 2000.ms)
                  .shake(hz: 4, curve: Curves.easeInOutCubic)
                  .scale(
                      begin: const Offset(1.0, 1.0),
                      end: const Offset(1 / 1.05, 1),
                      duration: 1200.ms)
                  .then(delay: 800.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    end: const Offset(1 / 1.05, 1),
                  ),
            ],
          )
        ],
      ),
    );
  }
}
