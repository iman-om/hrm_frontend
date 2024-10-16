// import 'dart:convert'; // For JSON decoding
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:hrm_front/common_features/data/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfileController extends GetxController {
//   var userProfile = User(
//     id: 0,
//     isAdmin: false,
//     firstName: '',
//     lastName: '',
//     email: '',
//     address: '',
//     phone: '',
//     designation: '',
//     departmentId: 0,
//     gender: '',
//     bankName: '',
//     bankRIB: '',
//     insuranceNumber: '',
//     dateBirth: '',
//     hrmConfigId: 0,
//     photo: '',
//     status: '',
//   ).obs;

//   var isLoading = false.obs;
//   var errorMessage = ''.obs;

//   // Fetch the user profile using an HTTP request with token
//   Future<void> fetchUserProfile(int userId) async {
//     isLoading.value = true;
//     errorMessage.value = '';

//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('authtoken'); // Retrieve token

//       if (token == null) {
//         errorMessage.value = 'Token not found. User might not be authenticated.';
//         return;
//       }

//       const String apiUrl = 'https://c653-105-235-128-52.ngrok-free.app/api/users'; // Update with your correct endpoint

//       final response = await http.get(
//         Uri.parse(apiUrl), // Construct URL with user ID
//         headers: {
//           'Authorization': 'Bearer $token', // Pass token in header
//           'Accept': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         userProfile.value = User.fromJson(data); // Update the user profile
//       } else {
//         errorMessage.value = 'Failed to load profile: ${response.statusCode}\n${response.body}';
//       }
//     } catch (error) {
//       errorMessage.value = 'Error fetching user profile: $error';
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }




import 'dart:convert'; // For JSON decoding
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hrm_front/common/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var userProfile = User(
    id: 0,
    isAdmin: false,
    firstName: '',
    lastName: '',
    email: '',
    address: '',
    phone: '',
    designation: '',
    departmentId: 0,
    gender: '',
    bankName: '',
    bankRIB: '',
    insuranceNumber: '',
    dateBirth: '',
    hrmConfigId: 0,
    photo: '',
    status: '',
    role: '', 
  ).obs;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Fetch the user profile using an HTTP request with token
  Future<void> fetchUserProfile(int userId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authtoken'); // Retrieve token

      if (token == null) {
        errorMessage.value = 'Token not found. User might not be authenticated.';
        return;
      }

      // Correctly append the userId to the URL
      const String apiUrl = 'https://f4b6-105-235-128-52.ngrok-free.app/api/users'; // Base API URL
      final String urlWithId = '$apiUrl/$userId'; // Construct URL with user ID

      final response = await http.get(
        Uri.parse(urlWithId), // Use the constructed URL with user ID
        headers: {
          'Authorization': 'Bearer $token', // Pass token in header
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        userProfile.value = User.fromJson(data); // Update the user profile
      } else {
        errorMessage.value = 'Failed to load profile: ${response.statusCode}\n${response.body}';
      }
    } catch (error) {
      errorMessage.value = 'Error fetching user profile: $error';
    } finally {
      isLoading.value = false;
    }
  }
}

