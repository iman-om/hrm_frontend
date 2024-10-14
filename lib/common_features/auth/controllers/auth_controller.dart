


// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:hrm_front/common_features/auth/views/Login_Screen.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';  // Token storage
// // import 'package:hrm_front/employee_app/Features/Homee/Home_screen.dart';

// class AuthenticationController extends GetxController {
//   final isLoading = false.obs;
//   final errorMessage = ''.obs;
//   final passwordVisible = false.obs;

//   // Login Method
//   Future<void> login(String email, String password) async {
//     try {
//       isLoading.value = true;
//       errorMessage.value = '';

//       const String apiUrl = 'https://59e2-105-235-130-183.ngrok-free.app/api/login';

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/vnd.api+json',
//         },
//         body: json.encode({
//           'email': email,
//           'password': password,
//         }),
//       );

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         final data = json.decode(response.body);
//         String token = data['token'];

//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('authtoken', token);

//         // Show success message and navigate to home screen
//         // Get.snackbar('Login Success', 'You are logged in!');
//         // Get.off(() => EmployeeHomePage());
        
//       } else {
//         errorMessage.value = 'Error: ${response.statusCode}\n${response.body}';
//       }
//     } catch (error) {
//       errorMessage.value = 'Error: $error';
//     } finally {
//       isLoading.value = false;
//     }
//   }

//    Future<String?> getToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('authtoken');
//   }

//   // Logout Method
//   Future<void> logout() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('authtoken');  
//     Get.offAll(() => LoginScreen());  
//   }

//   // Method to toggle password visibility
//   void togglePasswordVisibility() {
//     passwordVisible.value = !passwordVisible.value;
//   }
// }

import 'dart:convert';
import 'package:get/get.dart';
import 'package:hrm_front/common_features/auth/views/Login_Screen.dart';
import 'package:hrm_front/employee_app/features/homepage/employee_screen.dart';
import 'package:hrm_front/manager_app/features/homepage/manager_home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';  // Token storage

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final passwordVisible = false.obs;

  // Login Method
  Future<void> login(String email, String password, String role) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      const String apiUrl = 'https://59e2-105-235-130-183.ngrok-free.app/api/login';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/vnd.api+json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = json.decode(response.body);

        // Ensure 'token' exists in response
        if (data['token'] != null) {
          String token = data['token'];

          // Save token in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('authtoken', token);

          // Navigate based on role and email
          if (role == 'Manager' && email == 'assiatobal97@gmail.com') {
            Get.off(() => ManagerHomePage());
          } else if (role == 'Employee') {
            Get.off(() => EmployeeHomePage());
          } else {
            errorMessage.value = 'Invalid role or email combination.';
          }
        } else {
          errorMessage.value = 'Token not found in the response.';
        }
      } else {
        errorMessage.value = 'Error: ${response.statusCode}\n${response.body}';
      }
    } catch (error) {
      errorMessage.value = 'Error: $error';
    } finally {
      isLoading.value = false;
    }
  }

  // Retrieve token method
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('authtoken');
  }

  // Logout Method
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authtoken');  
    Get.offAll(() => LoginScreen());  
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }
}
