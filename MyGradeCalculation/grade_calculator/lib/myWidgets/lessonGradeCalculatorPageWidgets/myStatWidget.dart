import 'package:flutter/cupertino.dart';

class myStatWidget extends StatelessWidget {
  const myStatWidget({
    super.key,
    required this.grade,
    required this.letterGrade,
    required this.score,
    required this.status,
    required this.credit,
  });

  final double? grade;
  final String letterGrade;
  final double score;
  final String status;
  final double credit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${grade?.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            '$letterGrade / $score /  $credit / $status',
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
