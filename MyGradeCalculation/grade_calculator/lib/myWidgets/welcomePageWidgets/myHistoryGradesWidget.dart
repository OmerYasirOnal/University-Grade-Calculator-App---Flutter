import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grade_calculator/constants/constants.dart';

import '../../crudOperations/crud_operations.dart';
import '../../view/lessonGradeCalculator_Page.dart';

class MyHistoryGradesWidget extends StatelessWidget {
  const MyHistoryGradesWidget({
    Key? key,
    required this.uid,
  }) : super(key: key);

  final String? uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc('$uid')
          .collection('Terms')
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
        if (asyncSnapshot.hasData &&
            asyncSnapshot.data != null &&
            asyncSnapshot.data!.docs.isNotEmpty) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text(
                    'Dönem',
                    style: kTableHeaderTextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ortalama',
                    style: kTableHeaderTextStyle,
                  ),
                ),
                DataColumn(
                  label: Text(
                    'İşlemler',
                    style: kTableHeaderTextStyle,
                  ),
                ),
              ],
              rows: asyncSnapshot.data!.docs.map<DataRow>((doc) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Center(
                        child: Text(
                          doc.id,
                          style: kTableTextStyle,
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          doc['grade'].toString(),
                          style: kTableTextStyle,
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            await deleteUserGrade(uid!, doc.id);
                          },
                        ),
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
    );
  }
}
