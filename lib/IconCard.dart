import 'package:flutter/material.dart';
import 'costants.dart';


class IconCard extends StatelessWidget {
  IconCard({this.icon, this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,

        ),

        SizedBox(height: 18.0,),
        Text(
          text,
          style: kTextStyle
        )
      ],
    );
  }
}