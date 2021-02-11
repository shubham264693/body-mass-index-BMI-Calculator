import 'dart:math';

class cal_brain {

  cal_brain({this.height,this.weight});

  final int height;
  final int weight;

  double _bmi;

  String cal_brainBMI(){
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'Overweight, try to excercise more';
    }else if(_bmi>18.5){
      return 'Normal, Good You have normal bmi';
    }else{
      return 'Underweight, You should have to eat more';
    }

  }
}