import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../calculation/calculateTotalGrade.dart';
import '../myWidgets/lessonGradeCalculatorPageWidgets/myGradesAverageWidget.dart';
import '../myWidgets/lessonGradeCalculatorPageWidgets/myRecordButtonWidget.dart';
import '../myWidgets/lessonGradeCalculatorPageWidgets/myStatWidget.dart';
import 'calculation_page.dart';

class LessonGrade {
  String? name;
  double? grade;
  double weight; // Dersin ağırlığını tutar

  LessonGrade(this.name, this.grade, this.weight);
}

class LessonGradeCalculator extends StatefulWidget {
  final String? selectedTerm;
  final String? uid;

  const LessonGradeCalculator({Key? key, required this.selectedTerm, this.uid})
      : super(key: key);

  @override
  _LessonGradeCalculatorState createState() => _LessonGradeCalculatorState();
}

Future<void> deleteUserGrade(String uid, String term) async {
  final CollectionReference termCollection = FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Terms');

  await termCollection.doc(term).delete();
}

Future<void> updateUserData(String uid, String term, double average) async {
  final CollectionReference termCollection = FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Terms');

  String formattedAverage =
      average.toStringAsFixed(2); // limit to 2 decimal places

  await termCollection.doc(term).set({'grade': formattedAverage});
}

class _LessonGradeCalculatorState extends State<LessonGradeCalculator> {
  late String _selectedTerm;
  late String? uid;

  @override
  void initState() {
    super.initState();
    uid = widget.uid;
    _selectedTerm = widget.selectedTerm!;
  }

  final CalculateTotal _calculateTotal = CalculateTotal();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  int numberOfLessons = 1;
  List<LessonGrade> lessonGrades = [
    LessonGrade('', 0.0, 1.0)
  ]; // initial weight is set to 1

  void calculateCourseGrade(int index) async {
    LessonGrade lessonGrade = lessonGrades[index];
    double newGrade = await Get.to(() => const CourseGradeCalculator());
    setState(() {
      lessonGrades[index] =
          LessonGrade(lessonGrade.name, newGrade, lessonGrade.weight);
    });
  }

  @override
  Widget build(BuildContext context) {
    double _average = 0.0;
    double _credit = 0;
    double totalCredit = 0;

    _average = _calculateTotal.calculateSemesterAverage(lessonGrades);
    // Calculate totalCredit
    for (var grade in lessonGrades) {
      final score = _calculateTotal
          .getScore(_calculateTotal.getLetterGrade(grade.grade!));
      _credit += _calculateTotal.getCredits(score, grade.weight);
      totalCredit += grade.weight;
    }
    // your method will need to be adjusted to take weights into account
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ders Notunu Hesaplama'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Kaç Dersin Var:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            DropdownButton<int>(
              value: numberOfLessons,
              items: List.generate(
                  10,
                  (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text('${index + 1}'),
                      )),
              onChanged: (value) {
                setState(() {
                  numberOfLessons = value!;
                  lessonGrades = List.generate(
                      numberOfLessons,
                      (index) =>
                          LessonGrade('', 0.0, 1.0)); // default weight is 1
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ders adını ve ağırlığını gir, sonra notları hesapla: ',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                  itemCount: numberOfLessons,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Ders Adı',
                            ),
                            onChanged: (value) {
                              setState(() {
                                lessonGrades[index].name = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Ders Ağırlığı',
                            ),
                            onChanged: (value) {
                              setState(() {
                                lessonGrades[index].weight =
                                    double.parse(value);
                              });
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            '${lessonGrades[index].grade?.toStringAsFixed(2)} ',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          child: const Text('Hesapla'),
                          onPressed: () {
                            calculateCourseGrade(index);
                          },
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ders Notları:',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: numberOfLessons,
                itemBuilder: (context, index) {
                  final grade = lessonGrades[index].grade;
                  final letterGrade = _calculateTotal.getLetterGrade(grade!);
                  final score = _calculateTotal.getScore(letterGrade);
                  final status = _calculateTotal.getStatus(letterGrade);
                  final credit = _calculateTotal.getCredits(
                      score, lessonGrades[index].weight);

                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${lessonGrades[index].name}:',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      myStatWidget(
                        grade: grade,
                        letterGrade: letterGrade,
                        score: score,
                        status: status,
                        credit: credit,
                      ),
                    ],
                  );
                },
              ),
            ),
            myGradesAverageWidget(
              average: _average,
              credit: _credit,
              totalCredit: totalCredit,
            ),
            myRecordButtonWidget(
                uid: uid, selectedTerm: _selectedTerm, average: _average),
          ],
        ),
      ),
    );
  }
}
