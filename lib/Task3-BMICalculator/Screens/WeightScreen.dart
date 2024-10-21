import 'package:cognorise_infotech/Task3-BMICalculator/Providers/GenderProvider.dart';
import 'package:cognorise_infotech/Task3-BMICalculator/Providers/WeightProvider.dart';
import 'package:cognorise_infotech/Task3-BMICalculator/Screens/GenderScreen.dart';
import 'package:cognorise_infotech/Task3-BMICalculator/Screens/HeightScreen.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../Classes/User.dart';
import '../Providers/AgeProvider.dart';
import '../Providers/HeightProvider.dart';
import '../Widgets/NavButtons.dart';

import 'package:provider/provider.dart';

import '../Widgets/ResultSheet.dart';

class WeightScreen extends StatelessWidget {
  WeightScreen({super.key});

  Color bgc= Color(0xFF35455D);
  Color c= Color(0xFFF0CEC3);
  Color c2=Color(0xFFEcDDD0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgc,
      appBar: AppBar(
        backgroundColor: c2,
        title: Text("BMI Calculator", style: TextStyle(color: bgc ,fontWeight: FontWeight.w600, shadows: [Shadow(color: Colors.black , blurRadius: 2)]),),
        centerTitle: true,
      ),      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Select Weight",
                style: TextStyle(
                  color: c,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  shadows:  [
                    Shadow(color: Colors.grey[300]!, blurRadius: 10),
                  ],
                ),
              ),
              Consumer<WeightProvider>(builder: (context, weightProvider, child) {
                return Text(
                  "${weightProvider.weight.toStringAsFixed(1)} Kg",
                  style: TextStyle(
                    color: c2,
                    fontSize: 55,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(color: Colors.grey[300]!, blurRadius: 10),
                    ],
                  ),
                );
              }),
              Consumer<WeightProvider>(builder: (context, weightProvider, child) {
                return Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SfLinearGauge(
                      orientation: LinearGaugeOrientation.horizontal,
                      minimum: 25,
                      maximum: 220,
                      interval: 25,
                      minorTicksPerInterval: 5,
                      majorTickStyle: LinearTickStyle(
                        color: c2,
                        thickness: 1.5,
                        length: 7,
                      ),
                      minorTickStyle: LinearTickStyle(color: c2),
                      axisTrackStyle: LinearAxisTrackStyle(
                        color: c2,
                        thickness: 5,
                      ),
                      axisLabelStyle:
                      TextStyle(color: c2),
                      markerPointers: [
                        LinearWidgetPointer(
                          value: weightProvider.weight,
                          onChanged: (double newValue) {
                            weightProvider.setWeight(newValue);
                          },
                          position: LinearElementPosition.outside,
                          child: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: c2,
                            size: 50,
                          ),
                        ),
                      ],
                      barPointers: [
                        LinearBarPointer(
                          value: weightProvider.weight,
                          animationType: LinearAnimationType.bounceOut,
                          color: c,
                        ),
                      ],
                    ));
              }),
              CustomTextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HeightScreen()));
                  },
                  text: "Prev",
                  textColor: bgc,
                  buttonColor: c2),
              SliderButton(
                action: () async {
                  User user = User(
                      gender: Provider.of<GenderProvider>(context, listen: false)
                          .gender
                          .gender,
                      age: Provider.of<AgeProvider>(context, listen: false).age,
                      height: Provider.of<HeightProvider>(context, listen: false)
                          .height/100,
                      weight: Provider.of<WeightProvider>(context, listen: false)
                          .weight);

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GenderScreen()));

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ResultSheet(user, context);
                    },
                  );

                },
                label: const Text(
                  "Slide to Calculate",
                ),
                icon: Icon(
                  Icons.calculate,
                  color: bgc,
                ),
                buttonColor: c2,
                backgroundColor: c,
                highlightedColor: c2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
