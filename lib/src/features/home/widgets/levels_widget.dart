import 'package:flutter/material.dart';
import 'package:zeus_breakout_rivival/element/gameplayUI/game_play.dart';

class LevelWidget extends StatelessWidget {
  final ValueNotifier<bool> displayLevels;

  const LevelWidget({super.key, required this.displayLevels});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 229, 100, 255),
              Color.fromARGB(255, 122, 0, 222)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
            width: 6.0,
          ),
        ),
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            // clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 3.0,
              ),
              color: const Color.fromARGB(255, 229, 100, 255),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -5,
                        left: -7,
                        child: Text(
                          "Select Level",
                          style: TextStyle(
                            fontSize: 38,
                            fontStyle: FontStyle.italic,
                            color: Colors.black, // Border color
                          ),
                        ),
                      ),
                      Text(
                        "Select Level",
                        style: TextStyle(
                          fontSize: 35,
                          fontStyle: FontStyle.italic,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ],
                  ),
                ),

                /*********/
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (index + 1 == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Breakout();
                                },
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(2).copyWith(top: 7),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 3.0,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 70,
                            height: 70,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 229, 100, 255),
                                  Color.fromARGB(255, 122, 0, 222)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        top: index + 1 == 1 ? -13 : -6,
                                        left: -5,
                                        child: index + 1 == 1
                                            ? Text(
                                                "${index + 1}",
                                                style: const TextStyle(
                                                  fontSize: 50,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors
                                                      .black, // Border color
                                                ),
                                              )
                                            : const Icon(Icons.lock,
                                                size: 40, color: Colors.black),
                                      ),
                                      index + 1 == 1
                                          ? Text(
                                              "${index + 1}",
                                              style: const TextStyle(
                                                fontSize: 35,
                                                fontStyle: FontStyle.italic,
                                                color:
                                                    Colors.white, // Text color
                                              ),
                                            )
                                          : const Icon(
                                              Icons.lock,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                    ],
                                  ),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star),
                                    Icon(Icons.star),
                                    Icon(Icons.star),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                /*********/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
