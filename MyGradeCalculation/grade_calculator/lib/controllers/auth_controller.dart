import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/authPages/login_page.dart';
import '../view/authPages/welcome_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('login page');
      }
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(
          () => WelcomePage(email: user.email.toString(), uid: user.uid));
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final String? uid = auth.currentUser?.uid;

      await FirebaseFirestore.instance.collection('Users').doc(uid).set({});

      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.greenAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Account creation successful',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: const Text(
          'Your account has been created successfully!',
          style: TextStyle(color: Colors.white),
        ),
      );
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Account creation failed',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Login failed',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }
}
