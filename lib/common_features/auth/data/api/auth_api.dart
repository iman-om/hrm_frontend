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

        // Check if it's the user's first login
        bool isFirstLogin = prefs.getBool('isFirstLogin') ?? true;

        if (isFirstLogin) {
          // If it's the first login, navigate to the user details page
          // Get.offAll(() => UserDetailsScreen());
          // Set the flag to false after redirecting
          await prefs.setBool('isFirstLogin', false);
        } else {
          // If not the first login, navigate to the home screen
          // Get.offAll(() => EmployeeHomePage());
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

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('authtoken');
  }

  // Logout Method
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authtoken');  
    await prefs.setBool('isFirstLogin', true); // Resetting the first login flag
    Get.offAll(() => LoginScreen());  
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }
}
