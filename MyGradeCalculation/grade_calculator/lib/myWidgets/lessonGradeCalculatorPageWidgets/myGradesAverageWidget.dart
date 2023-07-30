import 'package:flutter/material.dart';

class myGradesAverageWidget extends StatelessWidget {
  final double average;
  final double credit;
  final double totalCredit;

  const myGradesAverageWidget({
    Key? key,
    required this.average,
    required this.credit,
    required this.totalCredit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
                'Dönem Toplam Kredi Sayısı: ${totalCredit.toStringAsFixed(0)}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dönem Ağırlıklı Krediler Toplamı: ${credit.toStringAsFixed(0)}',
              ),
            ),
            Text(
              'Dönem Ağırlıklı Not Ortalaması: ${average.toStringAsFixed(2)}',
            ),
          ],
        ),
      ),
    );
  }
}
