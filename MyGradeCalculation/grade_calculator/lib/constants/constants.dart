import 'package:flutter/material.dart';

TextStyle kMetinStily = const TextStyle(
  fontFamily: 'Roboto',
  color: Colors.black,
  fontSize: 14, // Updated fontSize
  fontWeight: FontWeight.bold,
);

TextStyle kSayiStily = TextStyle(
  color: Colors.black,
  fontSize: 14, // Updated fontSize
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  shadows: [
    Shadow(
      color: Colors.grey.withOpacity(0.3), // Updated opacity
      blurRadius: 1, // Updated blurRadius
      offset: Offset(1, 1),
    ),
  ],
);

TextStyle kGradeStily = TextStyle(
  color: Colors.black,
  fontSize: 14, // Updated fontSize
  fontWeight: FontWeight.w500,
  letterSpacing: 1.5,
  shadows: [
    Shadow(
      color: Colors.grey.withOpacity(0.3), // Updated opacity
      blurRadius: 2, // Updated blurRadius
      offset: const Offset(0, 2),
    ),
  ],
);

BoxDecoration MyBoxDecoration() {
  return BoxDecoration(
      color: Colors.lightBlueAccent, // Updated color
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
            spreadRadius: 1, // Updated spreadRadius
            blurRadius: 5, // Updated blurRadius
            offset: const Offset(1, 1),
            color: Colors.grey.withOpacity(0.2)) // Updated opacity
      ]);
}

BoxDecoration MyDecoration() {
  return BoxDecoration(
      color: Colors.white24,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
            spreadRadius: 1, // Updated spreadRadius
            blurRadius: 5, // Updated blurRadius
            offset: const Offset(1, 1),
            color: Colors.grey.withOpacity(0.2)) // Updated opacity
      ]);
}

class kMyDecoration extends BoxDecoration {
  kMyDecoration()
      : super(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Updated opacity
              spreadRadius: 1, // Updated spreadRadius
              blurRadius: 3, // Updated blurRadius
              offset: const Offset(0, 3),
            ),
          ],
        );
}

const kTableTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 14.0, // Updated fontSize
  fontWeight: FontWeight.normal,
);

const kTableHeaderTextStyle = TextStyle(
  fontSize: 14, // Updated fontSize
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);
