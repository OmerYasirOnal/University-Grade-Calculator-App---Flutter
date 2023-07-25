import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grade_calculator/constants/constants.dart';

import '../../crudOperations/crud_operations.dart';
import '../../view/lessonGradeCalculator_Page.dart';
import 'myCalculatorButtonWidget.dart';

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
                rows: data.entries.map<DataRow>((entry) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Center(
                          child: Text(
                            entry.key,
                            style: kTableTextStyle,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            entry.value.toString(),
                            style: kTableTextStyle,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Get.to(() => LessonGradeCalculator(
                                          selectedTerm: entry.key,
                                          uid: uid,
                                        ));
                                  },
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    await deleteUserGrade(uid!, entry.key);
                                  },
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
