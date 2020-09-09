import 'package:flutter/material.dart';


class CircleButton extends StatelessWidget {
  CircleButton({this.addOrMinus, this.value, this.function, this.heroTag});
  final IconData addOrMinus;
  final int value;
  final Function function;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: function,
      backgroundColor: Color(0xFF5D616F),
      child: Icon(
        addOrMinus,
        color: Colors.white,
      ),
    );
  }
}