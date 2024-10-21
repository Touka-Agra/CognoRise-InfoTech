import 'package:cognorise_infotech/Task3-BMICalculator/Screens/AgeScreen.dart';
import 'package:cognorise_infotech/Task3-BMICalculator/Widgets/GenderWidget.dart';
import 'package:cognorise_infotech/Task3-BMICalculator/Widgets/NavButtons.dart';
import 'package:flutter/material.dart';
import '../Classes/Gender.dart';

class GenderScreen extends StatelessWidget {
  GenderScreen({super.key});

  List<Gender> genders = [
    Gender(gender: 'Male', icon: Icons.male_outlined),
    Gender(gender: 'Female', icon: Icons.female_outlined),
  ];

  Color bgc= Color(0xFF35455D);
  Color c= Color(0xFFF0CEC3);
  Color c2=Color(0xFFEcDDD0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c2,
        title: Text("BMI Calculator", style: TextStyle(color: bgc ,fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black , blurRadius: 2)]),),
        centerTitle: true,
      ),
      backgroundColor:  bgc,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Select Gender",
                style: TextStyle(
                  color: c,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  shadows:  [
                    Shadow(color: Colors.grey[300]!, blurRadius: 5)
                  ],
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4 + 36,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: genders.length,
                itemBuilder: (context, index) {
                  return GenderWidget(genders[index], context);
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomTextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgeScreen()));
                },
                text: "Next",
                textColor: bgc,
                buttonColor:c,
          ))
        ],
      ),
    );
  }
}
