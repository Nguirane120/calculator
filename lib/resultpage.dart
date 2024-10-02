import 'package:calculator/const.dart';
import 'package:calculator/input_page.dart';
import 'package:flutter/material.dart';

class Resultpage extends StatelessWidget {
  const Resultpage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;

  final String resultText;

  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Color(0xffFDFDFD)),
        ),
        backgroundColor: const Color(0xff0A0D22),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              resultText,
              style: textStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff222847),
            ),
            height: 500.0,
            width: 150.0,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    resultText,
                    style: TextStyle(
                        color: Color(0xff22D073), fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  bmiResult,
                  style: textStyle,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: [
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff878A9D),
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: BottomButtom(
              text: "RECALCULATE",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
