// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:hrm_front/employee_app/Features/auth/views/Login_Screen.dart';
// import 'package:hrm_front/userdetails/view/userdetails.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';  // Token storage
// import 'package:hrm_front/employee_app/Features/Homee/Home_screen.dart';

// class AuthenticationController extends GetxController {
//   final isLoading = false.obs;
//   final errorMessage = ''.obs;
//   final passwordVisible = false.obs;

//   // Login Method
//   Future<void> login(String email, String password) async {
//     try {
//       isLoading.value = true;
//       errorMessage.value = '';

//       const String apiUrl = 'https://306f-105-235-129-152.ngrok-free.app/api/login';

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

//         // Check if the user has already entered their details
//         // bool hasUserDetails = prefs.containsKey('userDetails'); // Assume this key indicates user details exist

//         if (hasUserDetails) {
//           // Navigate to home screen if details already exist
//           Get.off(() => EmployeeHomePage());
//         } else {
//           // Navigate to user details screen if first login
//           // Get.off(() => UserDetailsScreen()); // Ensure this points to your user details screen
//         }
        
//       } else {
//         errorMessage.value = 'Error: ${response.statusCode}\n${response.body}';
//       }
//     } catch (error) {
//       errorMessage.value = 'Error: $error';
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<String?> getToken() async {
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
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';  // Token storage
// import 'package:hrm_front/employee_app/Features/Homee/Home_screen.dart';

class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final passwordVisible = false.obs;

  // Login Method
  Future<void> login(String email, String password) async {
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
        String token = data['token'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('authtoken', token);

        // Show success message and navigate to home screen
        // Get.snackbar('Login Success', 'You are logged in!');
        // Get.off(() => EmployeeHomePage());
        
      } else {
        errorMessage.value = 'Error: ${response.statusCode}\n${response.body}';
      }
    } catch (error) {
      errorMessage.value = 'Error: $error';
    } finally {
      isLoading.value = false;
    }
  }

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