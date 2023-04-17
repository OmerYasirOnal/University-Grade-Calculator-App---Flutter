import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/constants.dart';

class MyHistoryGradesWidget extends StatelessWidget {
  const MyHistoryGradesWidget({
    Key? key,
    required this.uid,
  }) : super(key: key);

  final String? uid;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc('$uid')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> asyncSnapshot) {
          if (asyncSnapshot.hasData &&
              asyncSnapshot.data != null &&
              asyncSnapshot.data!.exists) {
            Map<String, dynamic> data =
                asyncSnapshot.data!.data() as Map<String, dynamic>;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Term',
                      style: kTableHeaderTextStyle,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Average',
                      style: kTableHeaderTextStyle,
                    ),
                  ),
                ],
                rows: data.entries.map<DataRow>((entry) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          entry.key,
                          style: kTableTextStyle,
                        ),
                      ),
                      DataCell(
                        Text(
                          entry.value.toString(),
                          style: kTableTextStyle,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          } else if (asyncSnapshot.hasError) {
            return Text('Error: ${asyncSnapshot.error}');
          } else {
            return const Text(
              'Henüz Hiç Not Bilgisi Eklenmedi.',
              style: TextStyle(fontSize: 20),
            );
          }
        },
      ),
    );
  }
}
