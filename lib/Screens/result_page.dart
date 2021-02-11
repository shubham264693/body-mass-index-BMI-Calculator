import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';
import '../Components/reusable_card.dart';
import '../Components/bottom_button.dart';

class Resultpage extends StatelessWidget {

  Resultpage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Text(
                          resultText.toUpperCase(),
                        style: kResulTextStyle,
                      ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyMsg,
                    )
                  ],
                ),
              ),
          ),
          BottomButton(onTap:() {
            Navigator.pop(context);
          },
              buttonTitle: 'RECALCULATE')
        ],
      )
    );
  }
}
