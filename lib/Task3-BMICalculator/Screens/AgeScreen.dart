import 'package:cognorise_infotech/Task3-BMICalculator/Providers/AgeProvider.dart';
import 'package:cognorise_infotech/Task3-BMICalculator/Screens/GenderScreen.dart';
import 'package:cognorise_infotech/Task3-BMICalculator/Screens/HeightScreen.dart';
import 'package:flutter/material.dart';

import '../Widgets/NavButtons.dart';
import 'package:provider/provider.dart';

class AgeScreen extends StatelessWidget {
   AgeScreen({super.key});

  Color bgc= Color(0xFF35455D);
  Color c= Color(0xFFF0CEC3);
  Color c2=Color(0xFFEcDDD0);

  @override
  Widget build(BuildContext context) {
    final ageProvider = Provider.of<AgeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: bgc,
      appBar: AppBar(
        backgroundColor: c2,
        title: Text("BMI Calculator", style: TextStyle(color: bgc ,fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black , blurRadius: 2)]),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Age",
              style: TextStyle(
                color: c,
                fontSize: 35,
                fontWeight: FontWeight.w500,
                shadows:  [
                  Shadow(color: Colors.grey[300]!, blurRadius: 10),
                ],
              ),
            ),
            SizedBox(height: 10),
            Consumer<AgeProvider>(builder: (context, ageProvider, child) {
              return Text(
                "${ageProvider.age}", // Display height with one decimal
                style: TextStyle(
                  color: c2,
                  fontSize: 85,
                  fontWeight: FontWeight.w600,
                  shadows:  [
                    Shadow(color: Colors.grey[300]!, blurRadius: 10),
                  ],
                ),
              );
            }),

            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    ageProvider.addAge();
                  },
                  icon: Icon(Icons.add, size: 40),
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(c2),
                      shadowColor:  WidgetStatePropertyAll(Colors.grey[300]!),
                      shape: WidgetStatePropertyAll(CircleBorder())),
                ),

                IconButton(
                  onPressed: () {
                    ageProvider.subAge();
                  },
                  icon: Icon(Icons.remove, size: 40),
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(c2),
                      shadowColor: WidgetStatePropertyAll(Colors.grey[300]!),
                      shape: WidgetStatePropertyAll(CircleBorder())),
                ),
              ],
            ),

            SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GenderScreen()));
                      },
                      text: "Prev",
                      textColor: bgc,
                      buttonColor: c2),
                  SizedBox(width: 15),
                  CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HeightScreen()));
                      },
                      text: "Next",
                      textColor: bgc,
                      buttonColor: c)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
