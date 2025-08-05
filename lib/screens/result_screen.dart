import 'package:bmi_calc_app/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.bmi});
final double bmi;
String get state {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  Color get bmiColor {
    if (bmi < 18.5) {
      return Colors.yellow;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return appColors.bmiColor;
    } else if (bmi >= 25 && bmi < 29.9) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: appColors.primaryColor,
        centerTitle: true,
        title: const Text(
          "BMI Result",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          SizedBox(height: 50),
        Text(
          "Your BMI is",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: appColors.textColor,
          ),
        ),Text( bmi.toStringAsFixed(2),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: appColors.bmiColor,
          ),
        ),Text(state,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: bmiColor,
            ),
          ),
      ],)),
    );
  }
}
