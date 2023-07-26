import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/constants.dart';

import '../../NavBar.dart';
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
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyHistoryGradesWidget(uid: uid),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTermDropDownButton(),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: myCalculatorButtonWidget(
                    selectedTerm: _selectedTerm, widget: widget),
              ),
            ],
          ),
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
