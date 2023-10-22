import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grade_calculator/Screens/authentication_screens/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home',
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Beklenilmeyen bir hata oluştu.'));
          } else if (snapshot.hasData) {
            return LoginPage();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: null,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
