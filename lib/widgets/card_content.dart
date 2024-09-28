import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final Color cardColor;
  final IconData cardIcon;
  final String cardText;

  CardContent(
      {required this.cardColor,
      required this.cardIcon,
      required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
          color: cardColor,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          cardText,
          style: TextStyle(color: cardColor),
        )
      ],
    );
  }
}