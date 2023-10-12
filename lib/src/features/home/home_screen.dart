import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: TextButton(
            onPressed: (){},
            child: const Text('Start Game',
            style: TextStyle(
                fontFamily: 'PressStart2P',
              fontSize: 30,
              color: Colors.white
            ),),
          ),
        )
      )
    );
  }
}
