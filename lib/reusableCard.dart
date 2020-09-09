import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.cardChild, this.function});
  final Color color;
  final Widget cardChild;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(10.0),
            color: color
        ),
      ),
    );
  }
}