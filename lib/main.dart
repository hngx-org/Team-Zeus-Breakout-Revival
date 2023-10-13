import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeus_breakout_rivival/src/features/splashscreen/splash_screen.dart';
import 'package:zeus_breakout_rivival/utils/color_scheme.dart';

void main() {
  runApp(const MainApp());
  FlameAudio.bgm.initialize();

  FlameAudio.audioCache
      .loadAll(["AdhesiveWombat - Night Shade  NO COPYRIGHT 8-bit Music.mp3"]);

  FlameAudio.bgm
      .play('AdhesiveWombat - Night Shade  NO COPYRIGHT 8-bit Music.mp3');
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Breakout Rivival",
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.audiowideTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // home: SafeArea(
      //   child: GameWidget(
      //     game: game,
      //   ),
      // ),
    );
  }
}
