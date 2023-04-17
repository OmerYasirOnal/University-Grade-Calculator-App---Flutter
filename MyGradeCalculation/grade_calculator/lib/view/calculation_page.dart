import 'package:flutter/material.dart';
import 'package:grade_calculator/calculation/calculateCourseGrade.dart';
import 'package:grade_calculator/constants/constants.dart';

import '../myWidgets/calculationPageWidgets/build_grade_row.dart';
import '../myWidgets/calculationPageWidgets/myCalculateButtonWidget.dart';

class CourseGradeCalculator extends StatefulWidget {
  const CourseGradeCalculator({super.key});

  @override
  _CourseGradeCalculatorState createState() => _CourseGradeCalculatorState();
}

class _CourseGradeCalculatorState extends State<CourseGradeCalculator> {
  final Calculation _calculate = Calculation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Üniversite Notunu Hesapla'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  'Ders Notu Etkenlerinin Sayısını:',
                  style: kMetinStily,
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: DropdownButton<int>(
                    alignment: Alignment.center,
                    value: _calculate.numberOfInfluencingGrades,
                    items: List.generate(
                        10,
                        (index) => DropdownMenuItem(
                              value: index + 1,
                              child: Text(
                                '${index + 1}',
                                style: kSayiStily,
                              ),
                            )),
                    onChanged: (value) {
                      setState(() {
                        _calculate.numberOfInfluencingGrades = value!;
                        _calculate.grades = List.generate(
                            _calculate.numberOfInfluencingGrades,
                            (index) => 0.0);
                        _calculate.percentages = List.generate(
                            _calculate.numberOfInfluencingGrades,
                            (index) => 0.0);
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Text(
              'Dersin Notunu ve Yüzde kaç etkilediğini gir:',
              style: kMetinStily,
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: _calculate.numberOfInfluencingGrades,
                itemBuilder: (context, index) {
                  return buildingGradesRow(
                      grades: _calculate.grades,
                      percentages: _calculate.percentages,
                      index: index);
                },
              ),
            ),
            const SizedBox(height: 10.0),
            myCalculateButtonWidget(calculate: _calculate),
          ],
        ),
      ),
    );
  }
}
