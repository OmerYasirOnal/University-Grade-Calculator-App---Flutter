class Calculation {
  int numberOfInfluencingGrades = 1;
  List<double> grades = [0.0];
  List<double> percentages = [0.0];

  double calculateCourseGrade() {
    if (numberOfInfluencingGrades == 1) {
      return grades[0] * percentages[0] * 0.01;
    }
    double totalPercentage = percentages.reduce((a, b) => a + b);
    double weightedSum = 0.0;
    for (int i = 0; i < numberOfInfluencingGrades; i++) {
      weightedSum += (grades[i] * percentages[i]);
    }
    double courseGrade = weightedSum / totalPercentage;
    return double.parse(courseGrade.toStringAsFixed(4));
  }
}
