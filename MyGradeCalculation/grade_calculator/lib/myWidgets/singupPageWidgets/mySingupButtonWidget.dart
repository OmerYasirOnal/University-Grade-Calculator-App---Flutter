import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';

class mySingupButtonWidget extends StatelessWidget {
  const mySingupButtonWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AuthController.instance.register(
            emailController.text.trim(), passwordController.text.trim());
      },
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Text(
            'Kayıt ol',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
