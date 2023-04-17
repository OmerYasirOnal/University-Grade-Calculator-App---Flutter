import 'package:flutter/material.dart';

class textFieldWidget extends StatelessWidget {
  var index;

  textFieldWidget({super.key, required this.grades, required this.index});

  final List<double> grades;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 150,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(1, 1),
                  color: Colors.grey.withOpacity(0.3))
            ]),
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            grades[index] = double.parse(value);
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.black45, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 1)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }
}
