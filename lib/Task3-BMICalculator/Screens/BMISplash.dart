import 'package:cognorise_infotech/Task3-BMICalculator/Screens/GenderScreen.dart';
import 'package:flutter/material.dart';

class BMISplash extends StatelessWidget {
   BMISplash({super.key});

  Color bgc= Color(0xFF35455D);
  Color c= Color(0xFFF0CEC3);
  Color c2=Color(0xFFEcDDD0);
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GenderScreen()));
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: bgc,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(Icons.calculate_rounded , color: c, size: 70,),
              SizedBox(height: 15),
              Text("BMI CALCULATOR", style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: c,
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      color: Colors.grey[300]!,
                      blurRadius: 5,
                      offset: const Offset(2.0, 2.0),
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
