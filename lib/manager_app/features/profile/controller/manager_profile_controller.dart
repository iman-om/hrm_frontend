import 'dart:convert'; // For JSON decoding
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hrm_front/common/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hrm_front/common/data/api/endpoints.dart';

class ManagerProfileController extends GetxController {
  var userProfile = User(
    id: 0,
    firstName: '',
    lastName: '',
    email: '',
    address: '',
    phone: '',
    designation: '',
    departmentId: 0,
    bankName: '',
    bankRIB: '',
    insuranceNumber: '',
    dateBirth: '',
    hrmConfigId: '',
    photo: '',
    status: 0,
    role: '',
  ).obs;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> fetchUserProfile(int userId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authtoken'); // Retrieve token

      print('Token retrieved: $token');

      if (token == null) {
        errorMessage.value =
            'Token not found. User might not be authenticated.';
        print(errorMessage.value);
        return;
      }

      // Use the correct method from Endpoints
      final String urlWithId = Endpoints.getUserProfile(userId);

      print('Fetching profile for userId: $userId');
      print('Making request to: $urlWithId');
      print('Using token: $token');

      final response = await http.get(
        Uri.parse(urlWithId),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/vnd.api+json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Response data: $data');

        userProfile.value = User.fromJson(data);
      } else {
        print(json.decode(response.body));
        if (response.statusCode == 401) {
          print('Unauthorized access - possibly invalid token');
        } else if (response.statusCode == 404) {
          print('User not found with ID: $userId');
        }
        errorMessage.value =
            'Failed to load profile: ${response.statusCode}\n${response.body}';
        print(errorMessage.value);
      }
    } catch (error) {
      errorMessage.value = 'Error fetching user profile: $error';
      print(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  void assignUserRole(User user) {
    if (user.email == 'assiatobal97@gmail.com') {
      user.role = 'manager'; 
    } else {
      user.role = 'employee';
    }

    print('Assigned role: ${user.role}');
  }
}
