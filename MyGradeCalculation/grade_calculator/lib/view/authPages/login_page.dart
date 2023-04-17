import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grade_calculator/view/authPages/signup_page.dart';

import '../../myWidgets/loginPageWidgets/myEmailInputWidget.dart';
import '../../myWidgets/loginPageWidgets/myLoginButtonWidget.dart';
import '../../myWidgets/loginPageWidgets/myPasswordWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Merhaba',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Hesabınıza Giriş Yapınız',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                myEmailInputWidget(emailController: emailController),
                const SizedBox(
                  height: 10,
                ),
                myPasswordWidget(passwordController: passwordController),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          myLoginButtonWidget(
              emailController: emailController,
              passwordController: passwordController),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                text: "Bir hesabın yok mu?",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: " Kayıt Ol",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignupPage()),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
