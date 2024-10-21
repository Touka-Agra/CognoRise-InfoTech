import 'package:flutter/material.dart';

class WeightProvider extends ChangeNotifier {
  double weight = 80;

  setWeight(double newWeight) {
    weight = newWeight;
    notifyListeners();
  }
}
