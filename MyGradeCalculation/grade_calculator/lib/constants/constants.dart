import 'package:flutter/material.dart';

TextStyle kMetinStily = const TextStyle(
  fontFamily: 'Roboto',
  color: Colors.black,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

TextStyle kSayiStily = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  shadows: [
    Shadow(
      color: Colors.grey.withOpacity(0.5),
      blurRadius: 2,
      offset: Offset(1, 1),
    ),
  ],
);

TextStyle kGradesStily = TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.5,
  shadows: [
    Shadow(
      color: Colors.grey.withOpacity(0.5),
      blurRadius: 3,
      offset: const Offset(0, 2),
    ),
  ],
);

TextStyle kGradeStily = const TextStyle(
  color: Colors.black38,
  fontSize: 15,
  fontWeight: FontWeight.w900,
);

BoxDecoration MyBoxDecoration() {
  return BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(1, 1),
            color: Colors.grey.withOpacity(0.3))
      ]);
}

BoxDecoration MyDecoration() {
  return BoxDecoration(
      color: Colors.white24,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(1, 1),
            color: Colors.grey.withOpacity(0.3))
      ]);
}

class kMyDecoration extends BoxDecoration {
  kMyDecoration()
      : super(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        );
}

const kTableTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
);

const kTableHeaderTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);
