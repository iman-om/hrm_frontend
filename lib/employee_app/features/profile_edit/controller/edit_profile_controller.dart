import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/data/api/PrefsUtils.dart';
import 'package:hrm_front/common/data/models/user_model.dart';
import 'package:hrm_front/common/data/api/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Form field controllers
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var designationController = TextEditingController();
  var bankNameController = TextEditingController();
  var bankRIBController = TextEditingController();
  var insuranceNumberController = TextEditingController();
  var dateBirthController = TextEditingController();

  // Load the user profile data to populate form fields
  Future<void> loadUserProfile(User user) async {
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    emailController.text = user.email;
    addressController.text = user.address;
    phoneController.text = user.phone;
    designationController.text = user.designation;
    bankNameController.text = user.bankName;
    bankRIBController.text = user.bankRIB;
    insuranceNumberController.text = user.insuranceNumber;
    dateBirthController.text = user.dateBirth;
  }

  // Update user profile
  Future<void> updateUserProfile(int userId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authtoken');

      if (token == null) {
        errorMessage.value = 'Token not found. User might not be authenticated.';
        return;
      }

      final String urlWithId = Endpoints.updateUserProfile(userId);

      final response = await http.patch(
        Uri.parse(urlWithId),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/vnd.api+json',
        },
        body: json.encode({
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'email': emailController.text,
          'address': addressController.text,
          'phone': phoneController.text,
          'bank_name': bankNameController.text,
          'bank_rib': bankRIBController.text,
          'date_birth': dateBirthController.text,
        }),
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
      } else {
        errorMessage.value = 'Failed to update profile: ${response.statusCode}\n${response.body}';
      }
    } catch (error) {
      errorMessage.value = 'Error updating profile: $error';
    } finally {
      isLoading.value = false;
    }
  }
}
