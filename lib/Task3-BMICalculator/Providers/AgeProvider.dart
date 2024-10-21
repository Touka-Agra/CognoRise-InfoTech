import 'package:flutter/material.dart';

class AgeProvider extends ChangeNotifier {
  int age = 25;

  addAge() {
    age++;
    notifyListeners();
  }

  subAge() {
    if(age>18){
      age--;
    }
    notifyListeners();
  }
}
