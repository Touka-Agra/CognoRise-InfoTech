import 'package:flutter/material.dart';

import '../Classes/Gender.dart';

class GenderProvider extends ChangeNotifier {
  Gender gender = Gender(gender: 'Male', icon: Icons.male);

  setGender(Gender newGender) {
    gender = newGender;
    notifyListeners();
  }
}
