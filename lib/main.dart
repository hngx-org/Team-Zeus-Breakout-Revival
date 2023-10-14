import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeus_breakout_rivival/src/features/splashscreen/splash_screen.dart';
import 'package:zeus_breakout_rivival/utils/color_scheme.dart';
import 'package:zeus_breakout_rivival/utils/locator.dart';

Future<void> main() async {
  await setUpLocator();
  runApp(
    const ProviderScope(child: MainApp()),
  );
  FlameAudio.bgm.initialize();
  FlameAudio.audioCache.loadAll([
    "brick-play.mp3",
    "click.mp3",
  ]);

  if (FlameAudio.bgm.isPlaying) {
    FlameAudio.bgm.stop().then(
          (value) => FlameAudio.bgm.play('brick-play.mp3'),
        );
  } else {
    FlameAudio.bgm.play('brick-play.mp3');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Breakout Rivival",

      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
        fontFamily: 'Digitalt',
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.audiowideTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
        fontFamily: 'Digitalt',
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
