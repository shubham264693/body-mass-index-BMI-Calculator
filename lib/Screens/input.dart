
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/input_content.dart';
import '../Components/reusable_card.dart';
import '../Constants.dart';
import '../Screens/result_page.dart';
import '../Components/bottom_button.dart';
import '../Components/RoundButton.dart';
import '../Screens/cal_brain.dart';

enum Gender{
  male,
  female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 40;



//  Color maleCardColor = InactiveCardColor;
//  Color femaleCardColor = InactiveCardColor;
//
//  void updateColor(Gender selectedGender){
//    if (selectedGender == Gender.male){
//      if(maleCardColor == InactiveCardColor){
//        maleCardColor = ActiveCardColor;
//        femaleCardColor = InactiveCardColor;
//      }else{
//        maleCardColor = InactiveCardColor;
//      }
//    }
//
//    if (selectedGender==Gender.female){
//      if(femaleCardColor == InactiveCardColor){
//        femaleCardColor = ActiveCardColor;
//        maleCardColor = InactiveCardColor;
//      }else{
//        maleCardColor = InactiveCardColor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                      print('Male was get Pressed');
                    },
                    colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    CardChild: IconContent(icon: FontAwesomeIcons.mars ,label:'MALE' ,),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                      print("Female was get Pressed :)");
                    },
                    colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    CardChild: IconContent(icon: FontAwesomeIcons.venus,label: "FEMALE",),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'HEIGHT',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kTextStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                      },
                          ),
                        ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    CardChild : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed:(){
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            BottomButton(
                buttonTitle: 'CALCULATE',
                onTap:(){
                  cal_brain cal = cal_brain(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => Resultpage(bmiResult: cal.cal_brainBMI() ,resultText: cal.getResult() ,interpretation: cal.getInterpretation() ,),
              ),
              );
            },
            ),
          ],
        ));
  }
}







