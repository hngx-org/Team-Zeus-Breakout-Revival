import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zeus_breakout_rivival/src/features/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    _animation.addListener(() {
      setState(() {});
    });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
                "assets/images/ben-neale-zpxKdH_xNSI-unsplash.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: _animation.value,
                child: const Text(
                  "BREAKOUT",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "PressStart2P",
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 0, 109, 218),
                    fontSize: 42,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Transform.scale(
                scale: _animation.value,
                child: const Text(
                  "REVIVAL",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "PressStart2P",
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 255, 0, 0),
                    fontSize: 42,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
