import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../calculation/calculateCourseGrade.dart';
import '../../constants/constants.dart';

class myCalculateButtonWidget extends StatelessWidget {
  const myCalculateButtonWidget({
    super.key,
    required Calculation calculate,
  }) : _calculate = calculate;

  final Calculation _calculate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: ElevatedButton(
          child: Text(
            'Hesapla',
            style: kMetinStily,
          ),
          onPressed: () {
            double courseGrade = _calculate.calculateCourseGrade();
            Get.back(result: courseGrade);
          },
        ),
      ),
    );
  }
}
