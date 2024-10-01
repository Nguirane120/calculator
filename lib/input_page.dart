// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculator/const.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    style: textStyle,
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
                  child: ReusableCard(color: cardColor),
                ),
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xffEB1555),
            width: double.infinity,
            height: botomheightContainer,
            margin: EdgeInsetsDirectional.only(top: 10.0),
          ),
        ],
      ),
    );
  }
}
