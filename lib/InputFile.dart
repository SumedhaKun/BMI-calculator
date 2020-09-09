import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'IconCard.dart';
import 'costants.dart';
import 'circleButton.dart';
import 'bottomButton.dart';
import 'ResultPage.dart';
import 'calculatorBrain.dart';



enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected;
  int height=66;
  int weight=120;
  int age=23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        children: [
          Expanded(
            child: Row(
              children: [
                //MALE CARD
                 Expanded(
                    child: ReusableCard(color: genderSelected==Gender.male ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconCard(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                      function: (){
                        setState(() {
                          genderSelected=Gender.male;
                        });
                      },
                    ),
                  ),
                //FEMALE CARD
                Expanded(
                  child: ReusableCard(
                    function: (){
                      setState(() {
                        genderSelected=Gender.female;
                      });
                    },
                    color: genderSelected==Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconCard(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          //HEIGHT CARD
          Expanded(
            child: ReusableCard(
                color: kReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                  style: kTextStyle
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                          height.toString(),
                        style: kNumberFontStyle,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        'in',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF858692),
                      activeTrackColor: Colors.white70,
                      overlayColor: Color(0x29E83E66),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0
                      ),
                      thumbColor: kBottomContainerColor,
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 25.0
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),

                      onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                      },
                      min: 30.0,
                      max: 108.0,
                    ),
                  ),
                ],

              ),

            ),
          ),
          //WEIGHT AND AGE
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      color: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kTextStyle,),
                        Text(weight.toString(), style: kNumberFontStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleButton(addOrMinus: FontAwesomeIcons.minus, function:
                                (){setState(() {
                              weight--;
                            },
                            );
                                },
                              heroTag: 'btn1',
                            ),
                            SizedBox(width: 10.0,),
                            CircleButton(addOrMinus: FontAwesomeIcons.plus, function: (){
                              setState(() {
                                weight++;
                              });
                            },
                            heroTag: 'btn2',)
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(color: kReusableCardColor,
                      cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('AGE', style: kTextStyle,),
                      Text(age.toString(), style: kNumberFontStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(addOrMinus: FontAwesomeIcons.minus, function: (){
                            setState(() {
                              age--;
                            });
                          },
                            heroTag: 'btn3',
                          ),
                          SizedBox(width: 10.0,),
                          CircleButton(addOrMinus: FontAwesomeIcons.plus, function: (){
                            setState(() {
                              age++;
                            });
                          }, heroTag: 'btn4',
                          )
                        ],
                      ),

                    ],
                  ),),
                )
              ],
            ),
          ),
          BottomButton(label: 'CALCULATE', onTap: (){
            CalculateBMI calculate= CalculateBMI(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultsPage(bmiResult: calculate.calcBMI(), bmiText: calculate.getResult(), bmiDescription: calculate.getDescription());
            //
          })
          );}
          ,)
        ],
      ),
    );
  }
}




