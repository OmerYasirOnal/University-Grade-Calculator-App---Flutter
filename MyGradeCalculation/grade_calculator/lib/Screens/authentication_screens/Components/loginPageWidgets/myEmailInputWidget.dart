import 'package:flutter/material.dart';

class myEmailInputWidget extends StatelessWidget {
  const myEmailInputWidget({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                spreadRadius: 5,
                blurRadius: 30,
                offset: const Offset(1, 1),
                color: Colors.grey.withOpacity(0.3))
          ]),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'E-Posta',
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: Colors.blue,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white, width: 1)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
