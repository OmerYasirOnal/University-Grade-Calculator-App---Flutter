import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../view/lessonGradeCalculator_Page.dart';

class myRecordButtonWidget extends StatelessWidget {
  const myRecordButtonWidget({
    super.key,
    required this.uid,
    required String selectedTerm,
    required double average,
  })  : _selectedTerm = selectedTerm,
        _average = average;

  final String? uid;
  final String _selectedTerm;
  final double _average;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: GestureDetector(
          onTap: () async {
            await updateUserData(uid!, _selectedTerm, _average);
            Get.back(result: _average);
          },
          child: Container(
            width: 250,
            decoration: MyBoxDecoration(),
            child: Text(
              'Kaydet',
              style: kMetinStily,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
