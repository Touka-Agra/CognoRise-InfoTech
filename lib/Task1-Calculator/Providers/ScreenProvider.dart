import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class ScreenProvider extends ChangeNotifier{
  String text="0";

  double total = 0.0;

  bool isEqualPressed=false;

  addText(String char){
    isEqualPressed=false;
    if(text=="0") text="";
    text+=char;
    notifyListeners();
  }

  removeText(){
    isEqualPressed=false;
    if(text.length!=1){
      text=text.substring(0,text.length-1);
      notifyListeners();
    }
    else if(text.length==1){
      text="0";
      notifyListeners();
    }
  }

  bool calculate() {
    isEqualPressed=true;
    String expression=text;
    expression=expression.replaceAll("x", "*");
    expression=expression.replaceAll("÷", "/");
    expression=expression.replaceAll("−", "-");

    try{
      Parser p=Parser();
      Expression exp=p.parse(expression);
      ContextModel cm = ContextModel();
      total=exp.evaluate(EvaluationType.REAL, cm);
      notifyListeners();
      return true;
    }catch(e){
      return false;
    }
  }

  clearText(){
    isEqualPressed=false;
    text="0";
    total=0.0;
    notifyListeners();
  }
}