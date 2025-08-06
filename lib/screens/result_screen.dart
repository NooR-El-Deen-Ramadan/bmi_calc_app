import 'package:bmi_calc_app/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmi});
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

  String get bmiText {
    if (bmi < 18.5) {
      return "You are underweight. Consider consulting a healthcare provider for advice.";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "You have a normal weight. Keep up the good work!";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "You are overweight. Consider lifestyle changes for better health.";
    } else {
      return "You are obese. It's important to seek medical advice for your health.";
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
      body: Center(
        child: Column(
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
            ),
            SizedBox(height: 20),
            result_card(),
            SizedBox(height: 10),
            recalculateButton(context),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  SizedBox recalculateButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Recalculate",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Expanded result_card() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: appColors.cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bmi.toStringAsFixed(2),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: appColors.bmiColor,
                ),
              ),
              Text(
                state,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: bmiColor,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bmiText,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, color: bmiColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
