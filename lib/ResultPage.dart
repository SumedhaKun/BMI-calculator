import 'package:bmi_calculator/costants.dart';
import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';
import 'bottomButton.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiResult, this.bmiDescription, this.bmiText});
  final String bmiResult;
  final String bmiText;
  final String bmiDescription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Turn', style: kTitleText,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Text(bmiText,style: kResultText,),
                  Text(bmiResult, style: kBMItext,),
                  Text(bmiDescription, textAlign: TextAlign.center,style: kDescriptionText,)
                ],
              ),
            ),
          ),
          BottomButton(label: 'RE-CALCULATE', onTap: (){Navigator.pop(context);},
          ),
        ],
      ),
    );
  }
}
