import 'package:bmi_calculator/calc_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final inputft = TextEditingController();
  final inputin = TextEditingController();
  final inputm = TextEditingController();
  final inputlb = TextEditingController();
  final inputkg = TextEditingController();
  String? heightft = "";
  String? heightin = "";
  String? heightm = "";
  String? weightlb = "";
  String? weightkg = "";
  String? bmi = "";
  String? text = "";

  buttonPressed(String buttonText) {
    setState(() {
      heightft = inputft.text;
      heightin = inputin.text;
      heightm = inputm.text;
      weightkg = inputkg.text;
      weightlb = inputlb.text;
      if (buttonText == "Reset") {
        heightft = "";
        heightin = "";
        heightm = "";
        weightlb = "";
        weightkg = "";
        text = "";
        bmi = "";
        inputft.clear();
        inputin.clear();
        inputkg.clear();
        inputlb.clear();
        inputm.clear();
      } else if (buttonText == "Calculate(m)" &&
          double.tryParse(heightm!) != null &&
          double.tryParse(weightkg!) != null) {
 
        double b = double.parse(
            (double.parse(weightkg!) / (pow(double.parse(heightm!), 2)))
                .toStringAsFixed(2));
        bmi = "$b";
        text = msg(b);
      } else if (buttonText == "Calculate(c)" &&
          
          double.tryParse(heightft!) != null &&
          double.tryParse(heightin!) != null &&
          double.tryParse(weightlb!) != null) {

        double inches = double.parse(heightft!) * 12 + double.parse(heightin!);
        double b = 730.0 *
            double.parse((double.parse(weightlb!) / (pow(inches, 2)))
                .toStringAsFixed(2));
        bmi = "$b";
        text = msg(b);
      } else {
        bmi = "Invalid Input";
        text = "Invalid Input";
      }
    });
  }

//returns the message to be displayed
  String msg(double bmi) {
    if (bmi < 18.5) {
      return "Under weight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal Weight";
    } else if (bmi >= 25 && bmi < 30) {
      return "Over weight";
    } else {
      return "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(137, 60, 222, 138),
          title: const Text("BMI Calculator"),
        ),
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(137, 60, 222, 138),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 50, right: 50),
                alignment: Alignment.topCenter,
                height: 600,
                width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 216,
                            width: 325,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(174, 60, 159, 235),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black)),
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10, right: 10),
                                  height: 19,
                                  child: const Text(
                                    "Metric",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                174, 60, 159, 235),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black)),
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        height: 20,
                                        width: 100,
                                        child: const Text(
                                          "Height",
                                          style: TextStyle(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        )),
                                    Row(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10,
                                                left: 10,
                                                right: 10),
                                            height: 25,
                                            width: 150,
                                            child: TextField(
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder()),
                                              controller: inputm,
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                            )),
                                        const SizedBox(
                                          width: 100,
                                          height: 25,
                                          child: Text(
                                            "(Meters)",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                174, 60, 159, 235),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black)),
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        height: 20,
                                        width: 100,
                                        child: const Text(
                                          "Weight",
                                          style: TextStyle(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        )),
                                    Row(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            height: 25,
                                            width: 150,
                                            child: TextField(
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder()),
                                              controller: inputkg,
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                            )),
                                        const SizedBox(
                                          width: 100,
                                          height: 25,
                                          child: Text(
                                            "(Kilograms)",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                calcButton('Calculate(m)', Colors.blue,
                                    () => buttonPressed('Calculate(m)'))
                              ],
                            )),
                        Container(
                            height: 216,
                            width: 325,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(174, 60, 159, 235),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    alignment: Alignment.topCenter,
                                    margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            174, 60, 159, 235),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    height: 31,
                                    width: 305,
                                    child: const Text("Your BMI")),
                                Container(
                                    alignment: Alignment.topCenter,
                                    margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            174, 60, 159, 235),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    height: 31,
                                    width: 305,
                                    child: Text(bmi!)),
                                Container(
                                    alignment: Alignment.topCenter,
                                    margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            174, 60, 159, 235),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    height: 31,
                                    width: 305,
                                    child: const Text("You are")),
                                Container(
                                    alignment: Alignment.topCenter,
                                    margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            174, 60, 159, 235),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black)),
                                    height: 31,
                                    width: 305,
                                    child: Text(text!)),
                              ],
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 216,
                            width: 325,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(174, 60, 159, 235),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black)),
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10, right: 10),
                                  height: 19,
                                  child: const Text(
                                    "Customary",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                174, 60, 159, 235),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black)),
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        height: 15,
                                        width: 100,
                                        child: const Text(
                                          "Height",
                                          style: TextStyle(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        )),
                                    Row(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10,
                                                left: 10,
                                                right: 10),
                                            height: 20,
                                            width: 150,
                                            child: TextField(
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder()),
                                              controller: inputft,
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                            )),
                                        const SizedBox(
                                          width: 100,
                                          height: 20,
                                          child: Text(
                                            "(Feet)",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10,
                                                left: 10,
                                                right: 10),
                                            height: 20,
                                            width: 150,
                                            child: TextField(
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder()),
                                              controller: inputin,
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                            )),
                                        const SizedBox(
                                          width: 100,
                                          height: 20,
                                          child: Text(
                                            "(Inches)",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                174, 60, 159, 235),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black)),
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        height: 15,
                                        width: 100,
                                        child: const Text(
                                          "Weight",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 10),
                                        )),
                                    Row(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            height: 20,
                                            width: 150,
                                            child: TextField(
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder()),
                                              controller: inputlb,
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                            )),
                                        const SizedBox(
                                          width: 100,
                                          height: 15,
                                          child: Text(
                                            "(Pounds)",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                calcButton('Calculate(c)', Colors.blue,
                                    () => buttonPressed('Calculate(c)'))
                              ],
                            )),
                        Container(
                            height: 216,
                            width: 325,
                            margin: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(174, 60, 159, 235),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            alignment: Alignment.topCenter,
                            child: const Text(
                              """Underweight
<18.5
Normal
18.5 – 24.9
Overweight
25 – 29.9
Obesity
>29.9
""",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 21),
                            ))
                      ],
                    ),
                    calcButton('Reset', const Color.fromARGB(174, 60, 159, 235),
                        () => buttonPressed('Reset'))
                  ],
                ))));
  }
}
