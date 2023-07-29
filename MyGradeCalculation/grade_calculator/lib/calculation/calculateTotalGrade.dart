import '../view/lessonGradeCalculator_Page.dart';

class CalculateTotal {
  String getLetterGrade(double grade) {
    if (grade >= 90) {
      return 'AA';
    } else if (grade >= 85) {
      return 'BA';
    } else if (grade >= 75) {
      return 'BB';
    } else if (grade >= 65) {
      return 'CB';
    } else if (grade >= 60) {
      return 'CC';
    } else if (grade >= 50) {
      return 'DC';
    } else if (grade >= 45) {
      return 'DD';
    } else if (grade >= 40) {
      return 'FD';
    } else {
      return 'FF';
    }
  }

  double getCredits(double grade, double weight) {
    double credit = 0.0;

    credit = grade * weight;

    return credit;
  }

  double getScore(String letterGrade) {
    if (letterGrade == 'AA') {
      return 4.0;
    } else if (letterGrade == 'BA') {
      return 3.5;
    } else if (letterGrade == 'BB') {
      return 3.0;
    } else if (letterGrade == 'CB') {
      return 2.5;
    } else if (letterGrade == 'CC') {
      return 2.0;
    } else if (letterGrade == 'DC') {
      return 1.5;
    } else if (letterGrade == 'DD') {
      return 1.0;
    } else if (letterGrade == 'FD') {
      return 0.5;
    } else {
      return 0.0;
    }
  }

  double calculateAverageOfGrade(
      numberOfLessons, List<LessonGrade> lessonGrades) {
    double weightedSum = 0;
    double totalWeight = 0;

    for (var lessonGrade in lessonGrades) {
      double score = getScore(getLetterGrade(lessonGrade.grade!));
      weightedSum += score * lessonGrade.weight!;
      totalWeight += lessonGrade.weight!;
    }
    return totalWeight > 0 ? weightedSum / totalWeight : 0;
  }

  double calculateSemesterAverage(List<LessonGrade> lessonGrades) {
    double totalGradePoints = 0.0; // toplam not puanları
    double totalCredits = 0.0; // toplam kredi saatler

    for (var grade in lessonGrades) {
      totalGradePoints += getScore(getLetterGrade(grade.grade!)) *
          grade.weight; // not puanı = not * kredi saati
      totalCredits += grade.weight; // toplam kredi saatlerini güncelle
    }

    // dönem ortalaması = toplam not puanları / toplam kredi saatler
    double semesterAverage = totalGradePoints / totalCredits;

    return semesterAverage;
  }

  String getStatus(String letterGrade) {
    if (letterGrade == 'AA' ||
        letterGrade == 'BA' ||
        letterGrade == 'BB' ||
        letterGrade == 'CB' ||
        letterGrade == 'CC') {
      return 'Başarılı';
    } else if (letterGrade == 'DC') {
      return 'Koşullu Geçme';
    } else {
      return 'Başarısız';
    }
  }
}
