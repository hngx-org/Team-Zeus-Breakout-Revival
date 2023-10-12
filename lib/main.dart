import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeus_breakout_rivival/game/block_breaker.dart';
import 'package:zeus_breakout_rivival/utils/color_scheme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final game = BlockBreaker();
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
      home: SafeArea(
        child: GameWidget(
          game: game,
        ),
      ),
    );
  }
}
