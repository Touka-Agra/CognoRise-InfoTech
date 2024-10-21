import 'package:cognorise_infotech/Task3-BMICalculator/Screens/AgeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../Providers/HeightProvider.dart';
import '../Widgets/NavButtons.dart';
import 'WeightScreen.dart';

class HeightScreen extends StatelessWidget {
   HeightScreen({super.key});

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
      ),      backgroundColor: bgc,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select Height",
                      style: TextStyle(
                        color: c,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        shadows:  [
                          Shadow(color: Colors.grey[300]!, blurRadius: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Consumer<HeightProvider>(builder: (context, heightProvider, child) {
                      return Text(
                      "${heightProvider.height.toStringAsFixed(1)} cm",
                        style: TextStyle(
                          color: c2,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(color: Colors.grey[300]!, blurRadius: 10),
                          ],
                        ),
                      );}
                    ),
                  ],
                ),
                SizedBox(width: 20),
            Consumer<HeightProvider>(builder: (context, heightProvider, child)
                  {
                    return Padding(
                      padding: const EdgeInsets.only(right:12.0, bottom: 12 , top: 12),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.68,
                        child:  SfLinearGauge(
                          orientation: LinearGaugeOrientation.vertical,
                          minimum: 120,
                          maximum: 220,
                          interval: 10,
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
                              value: heightProvider.height,
                              onChanged: (double newValue) {
                                  heightProvider.setHeight(newValue);

                              },
                              position: LinearElementPosition.outside,
                              child: Icon(
                                Icons.arrow_right_rounded,
                                color: c2,
                                size: 50,
                              ),
                            ),
                          ],
                          barPointers: [
                            LinearBarPointer(
                              value: heightProvider.height,
                              animationType: LinearAnimationType.bounceOut,
                              color: c,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),

              ],
            ),
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
                                builder: (context) => AgeScreen()));
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
                                builder: (context) => WeightScreen()));
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
