// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zeus_breakout_rivival/src/features/home/widgets/widgets.dart';
import 'package:zeus_breakout_rivival/utils/extension.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSettingOn = useState(false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0, 1),
                    radius: 0,
                    colors: [Color(0xFFA659FE), Color(0xFF6F53FD)],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
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
                                  onTap: () =>
                                      isSettingOn.value = !isSettingOn.value,
                                )
                              : Column(
                                  children: [
                                    'settings'.imageWithTap(
                                      onTap: () => isSettingOn.value =
                                          !isSettingOn.value,
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
                        Container(
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
                          child: const Text(
                            'Level 01',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              '2499',
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
                                .shimmer(delay: 5000.ms, duration: 2000.ms)
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
                    )
                  ],
                ).padSymmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationIcon(
                    text: 'trophy||trophies||Trophy',
                  ),
                  BottomNavigationIcon(
                    text: 'hscore||lb||L-Board',
                  ),
                  BottomNavigationIcon(
                    text: 'bonu||bonus||Bonus',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// decoration: const BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment(0.00, -1.00),
//     end: Alignment(0, 1),
//     colors: [Color(0xFF9C59FE), Color(0xFF6F53FD)],
//   ),
// ),
/* 
Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/element5-digital-dwcC-OJ-bRs-unsplash.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(16).copyWith(top: 30),
              child: IconButton(
                icon: Icon(
                  music ? Icons.music_off : Icons.music_note,
                  size: 40,
                  color: const Color.fromARGB(255, 206, 0, 0),
                ),
                onPressed: () {
                  setState(() {
                    music = !music;
                  });

                  if (music) {
                    FlameAudio.bgm.stop();
                  } else {
                    FlameAudio.bgm.play(
                        'brick-play.mp3');
                  }
                },
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 31, 0, 206).withOpacity(1),
                    blurRadius: 0,
                    offset: const Offset(8, 8),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 206, 0, 0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                child: const Text(
                  'START GAME',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
 */
