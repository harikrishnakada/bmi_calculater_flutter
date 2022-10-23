import '../enum/globalEnums.dart';

class BMI_Model {
  late Gender gender;
  int height = 180;
  int weight = 50;
  int age = 20;

  double calculateBMI() {
    double heightInMeters = this.height.toDouble() / 100;
    double res = this.weight / (heightInMeters * heightInMeters);
    return res.toDouble();
  }

  String GetStatus(double bmi) {
    if (bmi < 18.5) {
      return 'UNDER WEIGHT';
    } else if (bmi < 24.9) {
      return 'NORMAL';
    } else if (bmi < 29.9) {
      return 'OVER WEIGHT';
    } else {
      return 'OBESE';
    }
  }
}
