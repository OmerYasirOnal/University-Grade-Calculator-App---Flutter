import 'package:flutter/cupertino.dart';

import '../../constants/constants.dart';

class myGradesAverageWidget extends StatelessWidget {
  myGradesAverageWidget({
    super.key,
    required double average,
  }) : _average = average;

  final double _average;

  @override
  Widget build(BuildContext context) {
    final text = '$_average';
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: MyBoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dönem Ortalaman: ',
              style: TextStyle(fontSize: 25.0),
            ),
            Text(
              text.length > 4 ? '${text.substring(0, 4)}..' : text,
              style: const TextStyle(fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
