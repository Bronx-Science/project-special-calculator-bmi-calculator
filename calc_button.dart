import 'package:flutter/material.dart';

Widget calcButton(
    String buttonText, Color buttonColor, void Function()? buttonPressed) {
  return Container(
    width: 75,
    height: buttonText == 'Reset' ? 50 : 45,
    padding: const EdgeInsets.all(10),
    child: ElevatedButton(
      onPressed: buttonPressed,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: buttonColor),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 25, color: Colors.white),
      ),
    ),
  );
}
