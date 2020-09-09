import 'dart:math';

class CalculateBMI {
  CalculateBMI({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calcBMI() {
    _bmi = (weight / (pow(height, 2))) * 703;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return ('Overweight');
    } else if (_bmi > 18.5) {
      return ('Normal');
    } else {
      return ('Underweight');
    }
  }

  String getDescription() {
    if (_bmi > 25) {
      return ('You are overweight. Try to eat healthy and exercise more!');
    } else if (_bmi > 18.5) {
      return ('You are in the norm. Keep at it!');
    } else {
      return ('You are underweight. Try to eat more!');
    }
  }
}



