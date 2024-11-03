import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/data/models/emlpyees_model.dart';
import 'package:hrm_front/common/data/values/colors.dart';
import 'package:hrm_front/common/data/values/constants.dart';
import 'package:hrm_front/manager_app/features/employees_profile/emploee_custom_app_bar.dart';

class EmployeeProfileScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeProfileScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
         decoration: const BoxDecoration(
          gradient: AppColors.gradientBackground, 
        ),
        child: Column(
          children: [
            CustomAppBar(
              text: 'Employee Profile',
              leftIconPng: 'assets/icons/arrow.png',
              onPressedLeftBtn: () {
                Get.back();
              }, 
              
            
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildProfileHeader(employee),
                      const SizedBox(height: 16), 
                      buildProfileDetail(
                          'Email', employee.email, 'assets/icons/email.png'),
                      buildProfileDetail('Address', employee.address,
                          'assets/icons/address.png'),
                      buildProfileDetail('Phone Number', employee.phone,
                          'assets/icons/phone.png'),
                      buildProfileDetail('Designation', employee.designation,
                          'assets/icons/posting.png'),
                      buildProfileDetail(
                          'Department ID',
                          employee.departmentId.toString(),
                          'assets/icons/posting.png'),
                      buildProfileDetail('Birthdate', employee.dateOfBirth,
                          'assets/icons/calendar.png'),
                          
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileHeader(Employee employee) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: employee.photoUrl.isNotEmpty
                  ? AssetImage(employee.photoUrl)
                  : const AssetImage('assets/images/default_avatar.png'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${employee.firstName} ${employee.lastName}',
                  style: const TextStyle(
                    fontFamily: AppConstants.fontApp,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9E9E9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.business_center_outlined,
                          color: Colors.black, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        employee.designation,
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
                  'Department ID: ${employee.departmentId}',
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
