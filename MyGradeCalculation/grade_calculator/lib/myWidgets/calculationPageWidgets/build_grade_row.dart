import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'myTextFieldWidget.dart';

class buildingGradesRow extends StatelessWidget {
  const buildingGradesRow({
    super.key,
    required this.grades,
    required this.percentages,
    required this.index,
  });

  final List<double> grades;
  final List<double> percentages;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Not ${index + 1}:', style: kGradeStily),
          const SizedBox(width: 20),
          textFieldWidget(grades: grades, index: index),
          const SizedBox(width: 20),
          Text(
            'Yüzde:',
            style: kGradeStily,
          ),
          const SizedBox(width: 20),
          textFieldWidget(grades: percentages, index: index),
        ],
      ),
    );
  }
}
