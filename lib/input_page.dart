// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculator/calculator.dart';
import 'package:calculator/const.dart';
import 'package:calculator/resultpage.dart';
import 'package:calculator/roundicon.dart';
import 'package:calculator/widgets/card.dart';
import 'package:calculator/widgets/card_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selctedGender;
  int height = 180;
  int weight = 60;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Color(0xffFDFDFD)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0A0D22),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selctedGender = Gender.male;
                      });
                    },
                    color: selctedGender == Gender.male
                        ? activeColor
                        : inactiveColor,
                    cardChild: CardContent(
                      cardColor: Color(0xffFFFFFF),
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selctedGender = Gender.female;
                      });
                    },
                    color: selctedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                    cardChild: CardContent(
                        cardColor: Color(0xffFFFFFF),
                        cardIcon: FontAwesomeIcons.venus,
                        cardText: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      color: Color(0xff878A9D),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: textStyle,
                      ),
                      Text(
                        "cm",
                        style: TextStyle(color: Color(0xffFFFFFF)),
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xffFF0167),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(color: cardColor),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                              color: Color(0xff878A9D),
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          weight.toString(),
                          style: textStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIcon(
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                              color: Color(0xff878A9D),
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          age.toString(),
                          style: textStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIcon(
                                onpress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButtom(
            text: "CALCULATE YOUR BMI",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Resultpage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}

class BottomButtom extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;

  BottomButtom({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xffEB1555),
        width: double.infinity,
        height: botomheightContainer,
        // margin: EdgeInsetsDirectional.only(top: 10.0),
        // padding: EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Color(
                  0xffFFFFFF,
                ),
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
