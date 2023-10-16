// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zeus_breakout_rivival/element/gameplayUI/game_play.dart';
import 'package:zeus_breakout_rivival/src/features/home/widgets/home_appbard.dart';
import 'package:zeus_breakout_rivival/src/features/home/widgets/widgets.dart';
import 'package:zeus_breakout_rivival/utils/extension.dart';
import 'package:zeus_breakout_rivival/utils/flame_utils.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeAppbar(isSettingOn: isSettingOn),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 203,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 14,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 189,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFD1D8FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 0,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 199,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFFEFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(21),
                                ),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topCenter,
                                children: [
                                  Positioned(
                                    top: -5,
                                    left: -5,
                                    child: 'left'.svgPicture,
                                  ),
                                  Positioned(
                                    top: -5,
                                    right: -5,
                                    child: 'right'.svgPicture,
                                  ),
                                  Positioned(
                                    top: -90,
                                    left: -5,
                                    child: 'conf'.svgPicture,
                                  ),
                                  Positioned(
                                    top: -20,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      height: 51,
                                      decoration: ShapeDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment(0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Color(0xFFFFA4EB),
                                            Color(0xFFEC36C9)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Center(
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: const TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Level 01\n',
                                                style: TextStyle(
                                                  color: Color(0xFFB20D78),
                                                  fontSize: 14,
                                                  fontFamily: 'Digitalt',
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Continue',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontFamily: 'Digitalt',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              60.hi,
                              (MediaQuery.of(context).size.width * 0.7).wi,
                              'score'.textSmall(
                                color: const Color(0xFF5FCFFF),
                              ),
                              Container(
                                width: 150,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFC1FDFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(31),
                                  ),
                                ),
                                child: Center(
                                  child: '999'.textLarge(
                                    color: const Color(0xFF228AED),
                                  ),
                                ),
                              ),
                              10.hi,
                              'reward'.textSmall(
                                color: const Color(0xFF5FCFFF),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  'coins'
                                      .svgPicture
                                      .animate(
                                        onPlay: (controller) =>
                                            controller.repeat(),
                                      )
                                      .shimmer(delay: 500.ms, duration: 2000.ms)
                                      .shake(
                                          hz: 4, curve: Curves.easeInOutCubic)
                                      .scale(
                                          begin: const Offset(1.0, 1.0),
                                          end: const Offset(1 / 1.05, 1),
                                          duration: 1200.ms)
                                      .then(delay: 800.ms)
                                      .scale(
                                        begin: const Offset(0.7, 0.7),
                                        end: const Offset(1 / 1.05, 1),
                                      ),
                                  10.wi,
                                  '25'.textLarge(
                                    color: const Color(0xFF228AED),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    'play'.imageWithTap(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Breakout();
                          },
                        ),
                      );
                    }).padOnly(
                      bottom: 50,
                    )
                  ],
                ).padSymmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationIcon(
                    text: 'trophy||trophies||Trophy',
                    onTap: () {
                      FlameUtils.playBgmWithDelay(
                        'click.mp3',
                        volume: 0.2,
                        delayMilliseconds: 300,
                      );
                    },
                  ),
                  BottomNavigationIcon(
                    text: 'hscore||lb||L-Board',
                    onTap: () {
                      FlameUtils.playBgmWithDelay(
                        'click.mp3',
                        volume: 0.2,
                        delayMilliseconds: 300,
                      );
                    },
                  ),
                  BottomNavigationIcon(
                    text: 'bonu||bonus||Bonus',
                    onTap: () {
                      FlameUtils.playBgmWithDelay(
                        'click.mp3',
                        volume: 0.2,
                        delayMilliseconds: 300,
                      );
                    },
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
                onPressed: () {
                   Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
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
