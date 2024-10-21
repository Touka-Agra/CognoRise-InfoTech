import 'package:flutter/material.dart';
import '../Classes/User.dart';

Widget ResultSheet(User user, BuildContext context) {
  // Calculate the BMI
  double result = user.weight / (user.height * user.height);

  // Color mapping for different BMI categories
  Map<int, List<Color>> colorMap = {
    1: [Color(0xFFE3CB7D), Color(0xFFB06179)],     // Underweight or overweight
    2: [Color(0xFFB06179),Color(0xFFA66466)], // At risk
    3: [Color(0xFFA7B55E), Color(0xFF5B744B)] // Healthy
  };

  // Determine BMI category based on gender and age
  if (user.gender == "Male") {
    if (user.age >= 18 && user.age < 24) {
      if (result < 18.5) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 25) return _buildResult("Normal weight", result, colorMap[3]!, context);
      if (result < 30) return _buildResult("Overweight", result, colorMap[1]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    } else if (user.age >= 25 && user.age < 34) {
      if (result < 19) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 25) return _buildResult("Normal weight", result, colorMap[3]!, context);
      if (result < 30) return _buildResult("Overweight", result, colorMap[1]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    } else if (user.age >= 35 && user.age < 44) {
      if (result < 20) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 26.9) return _buildResult("Normal weight", result, colorMap[3]!, context);
      if (result < 30) return _buildResult("Overweight", result, colorMap[1]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    } else if (user.age >= 45 && user.age < 64) {
      if (result < 21) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 27.9) return _buildResult("Normal weight", result, colorMap[3]!, context);
      if (result < 30) return _buildResult("Overweight", result, colorMap[1]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    } else if (user.age >= 65) {
      if (result < 22) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 29.9) return _buildResult("Normal weight", result, colorMap[3]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    }
  }

  // Women BMI categories based on age
  if (user.gender == "Female") {
    if (user.age >= 18 && user.age < 24) {
      if (result < 18.5) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 24.9) return _buildResult("Normal weight", result, colorMap[3]!, context);
      if (result < 29.9) return _buildResult("Overweight", result, colorMap[1]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    } else if (user.age >= 25 && user.age < 34) {
      if (result < 19) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 24.9) return _buildResult("Normal weight", result, colorMap[3]!, context);
      if (result < 29.9) return _buildResult("Overweight", result, colorMap[1]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    } else if (user.age >= 35 && user.age < 44) {
      if (result < 20) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 26.9) return _buildResult("Normal weight", result, colorMap[3]!, context);
      if (result < 29.9) return _buildResult("Overweight", result, colorMap[1]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    } else if (user.age >= 45 && user.age < 64) {
      if (result < 21) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 27.9) return _buildResult("Normal weight", result, colorMap[3]!, context);
      if (result < 29.9) return _buildResult("Overweight", result, colorMap[1]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    } else if (user.age >= 65) {
      if (result < 22) return _buildResult("Underweight", result, colorMap[1]!, context);
      if (result < 29.9) return _buildResult("Normal weight", result, colorMap[3]!, context);
      return _buildResult("Obese", result, colorMap[2]!, context);
    }
  }

  // Default result if no condition is met
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    width: MediaQuery.of(context).size.width * 0.65,

    padding: EdgeInsets.all(16),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      gradient: LinearGradient(colors: [Colors.white, Colors.grey]),
      boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 10 , spreadRadius: 5)],
    ),
    child: Center(
      child: Text(
        "Can't determine",
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget _buildResult(String category, double result, List<Color> colors, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    width: MediaQuery.of(context).size.width * 0.65,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      gradient: LinearGradient(colors: colors , begin: Alignment.topLeft, end: Alignment.bottomRight),
      boxShadow: [BoxShadow(color: colors[0],blurRadius: 5 , spreadRadius: 3)],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          category,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "BMI: ${result.toStringAsFixed(1)}",
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
