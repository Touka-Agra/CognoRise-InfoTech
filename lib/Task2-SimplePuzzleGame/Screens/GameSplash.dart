import 'package:cognorise_infotech/Task2-SimplePuzzleGame/Screens/Game.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameSplash extends StatelessWidget {
  const GameSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Game()));
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[800]!, Colors.purple[900]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/SlideGame/lotties/startt.json",
                width: 80,
                height: 80,
                fit: BoxFit.contain, ),
              SizedBox(height: 15),
              const Text("Slido Puzzle Game", style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.purpleAccent,
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      offset: Offset(2.0, 2.0),
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
