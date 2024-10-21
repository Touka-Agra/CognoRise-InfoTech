import 'package:flutter/material.dart';

Widget CustomTextButton(
    {required Function onPressed,
    required String text,
    required Color textColor,
    required Color buttonColor}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(buttonColor),
            shadowColor: const WidgetStatePropertyAll(Colors.black),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
          child: Text(text, style: TextStyle(color: textColor, fontSize: 20)),
        )),
  );
}
