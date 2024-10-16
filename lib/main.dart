import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/features/auth/views/Login_Screen.dart';
import 'package:hrm_front/common/features/splash/splash_screen.dart';
import 'package:hrm_front/employee_app/features/homepage/employee_screen.dart';
import 'package:hrm_front/employee_app/features/profile/controller/profile_controller.dart';
import 'package:hrm_front/employee_app/features/profile/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HRM App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () =>  const SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => EmployeeHomePage()),
        GetPage(name: '/profileemployee', page: () =>  EmployeeProfilePage(),binding: BindingsBuilder(() {
            Get.lazyPut<ProfileController>(() => ProfileController());
          }),),
      ],
    );
  }
}
