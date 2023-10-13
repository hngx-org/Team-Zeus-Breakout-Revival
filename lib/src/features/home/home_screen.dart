import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:zeus_breakout_rivival/element/gameplayUI/gameplayUI_and_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool music;

  @override
  void initState() {
    music = false;
    super.initState();
  }

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
                        'AdhesiveWombat - Night Shade  NO COPYRIGHT 8-bit Music.mp3');
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
    );
  }
}
