import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  UserNameField({super.key, required this.userNameController});

  final TextEditingController userNameController;

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
        controller: userNameController,
        decoration: InputDecoration(
          hintText: 'Kullanıcı Adı',
          prefixIcon: const Icon(
            Icons.person,
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
