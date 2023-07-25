import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/constants.dart';

import '../../crudOperations/crud_operations.dart';
import '../../myWidgets/welcomePageWidgets/myCalculatorButtonWidget.dart';
import '../../myWidgets/welcomePageWidgets/myExitButtonWidget.dart';
import '../../myWidgets/welcomePageWidgets/myHistoryGradesWidget.dart';
import '../../myWidgets/welcomePageWidgets/myWelcomePageWidget.dart';

class WelcomePage extends StatefulWidget {
  String uid;
  String email;

  WelcomePage({
    Key? key,
    required this.uid,
    required this.email,
  }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

CollectionReference users = Crudoperations().firestore.collection('Users');

class _WelcomePageState extends State<WelcomePage> {
  double average = 0;
  String? _selectedTerm;
  String? get uid => widget.uid;

  Future<void> onTermSelected(String? term) async {
    setState(() {
      _selectedTerm = term!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            welcomePageWidget(uid: widget.uid),
            const SizedBox(
              height: 30,
            ),
            myCalculatorButtonWidget(
                selectedTerm: _selectedTerm, widget: widget),
            SizedBox(
              height: 10,
            ),
            MyTermDropDownButton(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: MyHistoryGradesWidget(uid: uid),
            ),
            const SizedBox(
              height: 20,
            ),
            const MyExitButton(),
          ],
        ),
      ),
    );
  }

  Widget MyTermDropDownButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepPurple, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          style: kGradeStily,
          hint: const Text("Sınıf ve Dönem Seçiniz"),
          value: _selectedTerm,
          items: const [
            DropdownMenuItem(
              value: "1.Sınıf - 1.Dönem",
              child: Text("1.Sınıf - 1.Dönem"),
            ),
            DropdownMenuItem(
              value: "1.Sınıf - 2.Dönem",
              child: Text("1.Sınıf - 2.Dönem"),
            ),
            DropdownMenuItem(
              value: "2.Sınıf - 1.Dönem",
              child: Text("2.Sınıf - 1.Dönem"),
            ),
            DropdownMenuItem(
              value: "2.Sınıf - 2.Dönem",
              child: Text("2.Sınıf - 2.Dönem"),
            ),
            DropdownMenuItem(
              value: "3.Sınıf - 1.Dönem",
              child: Text("3.Sınıf - 1.Dönem"),
            ),
            DropdownMenuItem(
              value: "3.Sınıf - 2.Dönem",
              child: Text("3.Sınıf - 2.Dönem"),
            ),
            DropdownMenuItem(
              value: "4.Sınıf - 1.Dönem",
              child: Text("4.Sınıf - 1.Dönem"),
            ),
            DropdownMenuItem(
              value: "4.Sınıf - 2.Dönem",
              child: Text("4.Sınıf - 2.Dönem"),
            ),
          ],
          onChanged: onTermSelected,
        ),
      ),
    );
  }
}
