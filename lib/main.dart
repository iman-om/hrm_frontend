import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/data/api/PrefsUtils.dart';
import 'package:hrm_front/common/features/auth/views/Login_Screen.dart';
import 'package:hrm_front/common/features/splash/splash_screen.dart';
import 'package:hrm_front/employee_app/features/homepage/employee_screen.dart';
import 'package:hrm_front/employee_app/features/profile/controller/profile_controller.dart';
import 'package:hrm_front/employee_app/features/profile/view/view.dart';
import 'package:hrm_front/employee_app/features/profile_edit/view/profile_edit.dart';
import 'package:hrm_front/manager_app/features/homepage/manager_home.dart';
import 'package:hrm_front/manager_app/features/profile/controller/manager_profile_controller.dart';
import 'common/features/qr_code/qr_code_scanner/qr_code_scanner_screen.dart';
import 'employee_app/features/company_policy/companypolicy.dart';
import 'manager_app/features/profile/view/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsUtils.init();
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
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => EmployeeHomePage()),
        GetPage(name: '/manager_home', page: () => const ManagerHomePage()),

        GetPage(
          name: '/employee_profile',
          page: () {
            return EmployeeProfilePage();
          },
          binding: BindingsBuilder(() {
            Get.lazyPut<ProfileController>(() => ProfileController());
          }),
        ),
         GetPage(
          name: '/employee_editprofile',
          page: () {
            return EditProfileEmployeeScreen();
          },
          binding: BindingsBuilder(() {
            Get.lazyPut<ProfileController>(() => ProfileController());
          }),
        ),

        GetPage(
            name: '/manager_editprofile',
            page: () => const ManagerHomePage(),
            binding: BindingsBuilder(() {
              Get.lazyPut<ManagerProfileController>(
                  () => ManagerProfileController());
            })),


        GetPage(name: '/qr-scanner', page: () => QRCodeScannerScreen()),


        GetPage(
          name: '/policies',
          page: () => PoliciesPage(),
        ),
      ],
    );
  }
}
