import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/data/models/user_model.dart';
import 'package:hrm_front/common/data/values/colors.dart';
import 'package:hrm_front/common/data/values/constants.dart';
import 'package:hrm_front/manager_app/features/profile/controller/manager_profile_controller.dart';
import 'package:hrm_front/manager_app/widgets/custom_app_bar.dart';

class ManagerProfilePage extends StatelessWidget {
  final ManagerProfileController profileController = Get.put(ManagerProfileController());

  ManagerProfilePage({super.key}) {
    // Fetch user profile when the page is created
    // Replace with the logic to dynamically fetch userId if needed
    int userId = 1; // Adjust logic to get the actual user ID
    profileController.fetchUserProfile(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.gradientBackground, // Apply gradient background
        ),
        child: Column(
          children: [
            CustomAppBar(
              text: 'My Profile',
              leftIconPng: 'assets/icons/arrow.png',
              rightIconPng: 'assets/icons/edit.png',
              onPressedLeftBtn: () {
                Get.back();
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(() {
                  if (profileController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (profileController.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(
                        profileController.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  final userProfile = profileController.userProfile.value;

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildProfileHeader(userProfile),
                        const SizedBox(height: 16), // Spacing between sections
                        buildProfileDetail('Email', userProfile.email, 'assets/icons/email.png'),
                        buildProfileDetail('Address', userProfile.address, 'assets/icons/address.png'),
                        buildProfileDetail('Phone Number', userProfile.phone, 'assets/icons/phone.png'),
                        buildProfileDetail('Designation', userProfile.designation, 'assets/icons/posting.png'),
                        buildProfileDetail('Birthdate', userProfile.dateBirth, 'assets/icons/calendar.png'),
                        buildProfileDetail('Bank Name', userProfile.bankName, 'assets/icons/bank.png'),
                        buildProfileDetail('Bank RIB', userProfile.bankRIB, 'assets/icons/card.png'),
                        buildProfileDetail('Social Security Number', userProfile.insuranceNumber, 'assets/icons/id-card.png'),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileHeader(User userProfile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: userProfile.photo?.isNotEmpty == true
                  ? NetworkImage(userProfile.photo!)
              as ImageProvider // Handle null or empty photo
                  : const AssetImage('assets/images/woman.jpg'), // Default image
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${userProfile.firstName} ${userProfile.lastName}',
                  style: const TextStyle(
                    fontFamily: AppConstants.fontApp,
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9E9E9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.business_center_outlined, color: Colors.black, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        userProfile.designation,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: AppConstants.fontApp,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Role: ${userProfile.role}',
                  style: const TextStyle(
                    fontFamily: AppConstants.fontApp,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Department ID: ${userProfile.departmentId}',
                  style: const TextStyle(
                    fontFamily: AppConstants.fontApp,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildProfileDetail(String title, String value, String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: AppConstants.fontApp,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              children: [
                Image.asset(iconPath, height: 40, width: 40),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    value.isNotEmpty ? value : 'Not provided',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: AppConstants.fontApp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}