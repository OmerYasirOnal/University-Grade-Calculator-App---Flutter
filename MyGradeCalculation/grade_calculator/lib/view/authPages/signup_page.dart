import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grade_calculator/myWidgets/loginPageWidgets/myEmailInputWidget.dart';
import 'package:grade_calculator/myWidgets/loginPageWidgets/myPasswordWidget.dart';

import '../../myWidgets/singupPageWidgets/mySingupButtonWidget.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Kayıt Ol',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              myEmailInputWidget(emailController: emailController),
              const SizedBox(
                height: 20,
              ),
              myPasswordWidget(passwordController: passwordController),
              const SizedBox(
                height: 20,
              ),
              mySingupButtonWidget(
                  emailController: emailController,
                  passwordController: passwordController),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "Zaten bir hesabım var mı?",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: " Giriş yap",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const LoginPage()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
