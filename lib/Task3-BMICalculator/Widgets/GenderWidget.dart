import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Classes/Gender.dart';
import '../Providers/GenderProvider.dart';

Widget GenderWidget(Gender gender, BuildContext context) {
  Color bgc= Color(0xFF35455D);
  Color c= Color(0xFFF0CEC3);
  Color c2=Color(0xFFEcDDD0);

  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Consumer<GenderProvider>(
      builder: (context, genderProvider, child) {
        return GestureDetector(
          onTap: () {
            genderProvider.setGender(gender);
          },
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: gender.gender == genderProvider.gender.gender
                      ? c2
                      : Colors.transparent,
                  width: 4.0,
                ),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    blurRadius: 5,

                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    gender.icon,
                    color: bgc,
                    size: 45,
                  ),
                  Text(
                    gender.gender,
                    style: TextStyle(
                      color: bgc,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
