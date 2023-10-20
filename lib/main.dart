import 'package:flutter/material.dart';
import 'package:zeus_breakout_rivival/game_info/info.dart';
import 'package:zeus_breakout_rivival/src/features/splashscreen/splash_screen.dart';
// import 'package:zeus_breakout_rivival/src/features/splashscreen/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Brick Breaker",
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
