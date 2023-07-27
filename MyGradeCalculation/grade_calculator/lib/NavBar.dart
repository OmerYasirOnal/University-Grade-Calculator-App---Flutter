import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grade_calculator/view/ProfileScreen.dart';
import 'package:grade_calculator/view/authPages/login_page.dart';

import 'myWidgets/ProfileMenuWitget.dart';

class NavBar extends StatelessWidget {
  String name = "";
  String email = "";

  NavBar(this.name, this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text(
                " $name ",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text(" $email "),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 165, 255, 137),
                child: Text(
                  name[0],
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ),
              ),
            ),
          ),
          // ProfileMenuWidget(
          //     title: "Profil",
          //     icon: Icons.person,
          //     textColor: Colors.black,
          //     endIcon: false,
          //     onPress: () {
          //       Get.to(() => ProfileScreen(name, email));
          //     }),
          // Divider(),
          ProfileMenuWidget(
              title: "Logout",
              icon: Icons.exit_to_app,
              textColor: Colors.red,
              endIcon: false,
              onPress: () async {
                Get.defaultDialog(
                  title: "LOGOUT",
                  titleStyle: const TextStyle(fontSize: 20),
                  content: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text("Are you sure, you want to Logout?"),
                  ),
                  confirm: Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.to(() => LoginPage());
                        await FirebaseAuth.instance.signOut();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          side: BorderSide.none),
                      child: const Text("Yes"),
                    ),
                  ),
                  cancel: OutlinedButton(
                      onPressed: () => Get.back(), child: const Text("No")),
                );
              }),
        ],
      ),
    );
  }
}
