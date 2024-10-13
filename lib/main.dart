import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common_features/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HRM App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()), 
        // GetPage(name: '/login', page: () => LoginScreen()), 
        // GetPage(name: '/home', page: () => EmployeeHomePage( )), 
      ],
    );
  }
}
