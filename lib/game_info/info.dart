import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Scaffold(
      body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sky.png'),
                fit: BoxFit.cover
              )
            ),
            width: size.width,
            height: size.height,
            // color: Colors.blue,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            //Back to main Screen
                          },
                          icon: Icon(Icons.arrow_back_ios_new_rounded), color: Colors.black,),
                      ],
                    ),
                    const Text('STORY',
                    style: TextStyle(
                      fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),),
                    SizedBox(height: 20,),

                    const Text('After its long aqua exploration, Breaker ZeusXX was returning to home when it was dragged by unknown force and trapped in a huge prison, Can you help ZeusXX with various powerUps to overcome numerous challenges and return home safely?',
                        textAlign:TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    const Text('PowerUps',
                      textAlign:TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),
                    const Text('L - Increases the length of the paddle',
                        textAlign:TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black
                        )),
                    const Text('S - Increases the speed of the ball',
                        textAlign:TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black
                        )),
                    const Text('B - One unit ball is added to the gameplay',
                        textAlign:TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black
                        ))
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
