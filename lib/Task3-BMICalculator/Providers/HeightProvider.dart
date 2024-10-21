import 'package:flutter/material.dart';

class HeightProvider extends ChangeNotifier {
  double height = 175;

  setHeight(double newHeight) {
    height = newHeight;
    notifyListeners();
  }
}
