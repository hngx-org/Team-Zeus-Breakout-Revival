import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:zeus_breakout_rivival/utils/extension.dart';

class GameStatus extends StatelessWidget {
  final bool gameComplete;
  final bool gameFail;
  final int score;

  const GameStatus(
      {super.key,
      required this.gameComplete,
      required this.gameFail,
      required this.score});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(185, 166, 89, 254),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 203,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: (MediaQuery.of(context).size.height - 203) / 2,
                left: (MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.7) /
                    2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      top: 14,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: gameComplete ? 290 : 210,
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
                        height: gameComplete ? 300 : 220,
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
                              left: 5,
                              child: 'conf'.svgPicture,
                            ),
                            Positioned(
                              top: -20,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.55,
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
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Center(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Level 01\n',
                                          style: TextStyle(
                                            color: Color(0xFFB20D78),
                                            fontSize: 14,
                                            fontFamily: 'Digitalt',
                                          ),
                                        ),
                                        TextSpan(
                                          text: gameComplete
                                              ? 'Complete'
                                              : 'Failed !',
                                          style: const TextStyle(
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
                    Positioned(
                      top: -80,
                      left: 70,
                      child: gameComplete
                          ? "star_ing".svgPicture
                          : "star_empty".svgPicture,
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
                            child: score.toString().textLarge(
                                  color: const Color(0xFF228AED),
                                ),
                          ),
                        ),
                        10.hi,
                        ''.textSmall(
                          color: const Color(0xFF5FCFFF),
                        ),
                        gameComplete
                            ? 'reward'.textSmall(
                                color: const Color(0xFF5FCFFF),
                              )
                            : const SizedBox(),
                        gameComplete
                            ? Row(
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
                            : const SizedBox(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: gameComplete
                              ? "ok_btn".svgPicture
                              : 'continue'.svgPicture,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
