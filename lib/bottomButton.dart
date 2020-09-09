import 'package:flutter/material.dart';
import 'costants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.label, this.onTap});
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label, style: kBigButtonText,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 20.0),

      ),
    );
  }
}
