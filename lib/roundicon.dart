import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  const RoundIcon({required this.icon, required this.onpress});
  final IconData icon;
  final VoidCallback onpress;
//
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10.0,
      child: Icon(
        icon,
        color: Color(0xffFFFFFF),
      ),
      onPressed: onpress,
      shape: CircleBorder(),
      fillColor: Color(0xff222847),
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
    );
  }
}
