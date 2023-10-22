import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grade_calculator/Screens/authentication_screens/Components/loginPageWidgets/myEmailInputWidget.dart';
import 'package:grade_calculator/Screens/authentication_screens/Components/loginPageWidgets/myPasswordWidget.dart';
import 'package:grade_calculator/Screens/authentication_screens/Components/singupPageWidgets/UserNameField.dart';
import 'package:grade_calculator/Screens/authentication_screens/Components/singupPageWidgets/mySingupButtonWidget.dart';

import 'login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var userNameController = TextEditingController();
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myEmailInputWidget(emailController: emailController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserNameField(userNameController: userNameController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myPasswordWidget(passwordController: passwordController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: mySingupButtonWidget(
                    emailController: emailController,
                    passwordController: passwordController,
                    userNameController: userNameController),
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
