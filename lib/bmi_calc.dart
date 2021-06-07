import 'dart:math';

class BmiCalculator {
  final int height;
  final int weight;
  late double _bmi;
  BmiCalculator(this.height, this.weight);

  String resBmi() {
    _bmi = (weight * 10000) / (height * height);
    return _bmi.toStringAsFixed(1);
  }

  String statusBmi() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpret() {
    if (_bmi >= 25) {
      return "You have higher body weight than a normal body. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You have lower weight than a normal body. Have a healthy balanced diet.  ";
    }
  }
}
