import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';

class MyExitButton extends StatelessWidget {
  const MyExitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AuthController.instance.logOut();
      },
      child: Container(
        margin: EdgeInsets.all(50),
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
          child: Text(
            'Çıkış Yap',
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
