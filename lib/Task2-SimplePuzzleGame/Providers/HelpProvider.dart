import 'package:flutter/cupertino.dart';

class HelpProvider extends ChangeNotifier{
  bool needHelp = false;
  int helps = 1;

  bool isShowSelected=false;

  startHelp(){
    if (helps != 0) {
      needHelp = true;
      notifyListeners();
    }
  }

  removeHelp(){
    needHelp = false;
    helps--;
    notifyListeners();
  }

  restart(){
    needHelp = false;
    helps = 1;
    notifyListeners();

  }
}