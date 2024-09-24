import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{
  bool isLight=true;

  themeToggle(){
    isLight=!isLight;
    notifyListeners();
  }
}