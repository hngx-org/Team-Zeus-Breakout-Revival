import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import "package:lottie/lottie.dart";

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              margin: const EdgeInsets.all(16).copyWith(top: 30, right: 0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.transparent,
                ),
                child: Lottie.asset(
                  'assets/lotties/Animation - 1697192732318.json',
                  height: 70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
