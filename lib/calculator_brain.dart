import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({this.height, this.weight});
  double _bmi;

  String bmiCal() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);

    return _bmi.toStringAsFixed(1);
  }

  String getOutput() {
    if (_bmi > 25.0)
      return 'OVERWEIGHT';
    else if (_bmi < 18.5)
      return 'UNDERWEIGHT';
    else
      return 'NORMAL';
  }

  String getResult() {
    if (_bmi > 25.0)
      return 'OVERWEIGHT';
    else if (_bmi < 18.5)
      return 'UNDERWEIGHT';
    else
      return 'NORMAL';
  }
}
