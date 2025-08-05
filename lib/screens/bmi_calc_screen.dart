import 'package:bmi_calc_app/colors.dart';
import 'package:bmi_calc_app/screens/result_screen.dart';
import 'package:flutter/material.dart';



  
  bool isMale = true;
class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  int weight = 60;
  int age = 20;
  int height = 180;bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: appColors.primaryColor,
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            maleAndFemale(),
            SizedBox(height: 15),
            heightUi(),
            SizedBox(height: 15),
            weigtAndAge(),
            SizedBox(height: 15),
            calculate_button(),
          ],
        ),
      ),
    );
  }

  SizedBox calculate_button() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: appColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          double bmi = weight / ((height / 100) * (height / 100));
Navigator.push(
          context,MaterialPageRoute(builder: (context)  => ResultScreen(bmi:bmi)
            ),
          );

        },
        child: const Text(
          "Calculate",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Expanded heightUi() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: appColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Height",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("cm", style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
            Slider(
              value: height.toDouble(),
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
              min: 120,
              max: 220,
              activeColor: appColors.primaryColor,
              inactiveColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Expanded weigtAndAge() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: appColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Weight",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weight.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: appColors.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: appColors.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: appColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Age",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    age.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: appColors.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: appColors.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            age++;
                          });

                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


Expanded maleAndFemale() {
  return Expanded(
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isMale ? appColors.primaryColor: appColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.male, size: 100, color: Colors.white),
                  Text(
                    "Male",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isMale ? appColors.cardColor : appColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.female, size: 100, color: Colors.white),
                  Text(
                    "Female",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}