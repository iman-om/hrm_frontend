// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hrm_front/common/data/models/user_model.dart';
// import 'package:hrm_front/common/data/values/colors.dart';
// import 'package:hrm_front/common/data/values/constants.dart';
// import 'package:hrm_front/employee_app/features/profile/controller/profile_controller.dart';
// import 'package:hrm_front/employee_app/widgets/custom_app_bar.dart';

// class EmployeeProfilePage extends StatelessWidget {
//   final ProfileController profileController = Get.put(ProfileController());

//   EmployeeProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: CustomAppBar(
//         text: 'My Profile',
//         leftIconPng: 'assets/icons/arrow.png',
//         rightIconPng: 'assets/icons/edit.png',
//         onPressedLeftBtn: () {
//           Get.back();
//         },
//         // onPressedLeftBtn: () {
//         //         Get.back();
//         //       },
//         //       onPressedRightBtn: () {
//         //         // navigation to edit profile screen
//         //         // Get.to(EditProfileScreen());
//         //       },
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: GetBuilder<ProfileController>(
//           init: profileController,
//           builder: (controller) {
//             final userProfile = controller.userProfile.value;

//             if (controller.isLoading.value) {
//               return Center(child: CircularProgressIndicator());
//             }

//             if (userProfile == null) {
//               return Center(
//                 child: Text(
//                   "User profile not available",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               );
//             }

//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   buildProfileHeader(userProfile),
//                   const SizedBox(height: 16),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 4),
//                       ],
//                     ),
//                   ),
//                   buildProfileDetail(
//                       'Email', userProfile.email, 'assets/icons/email.png'),
//                   buildProfileDetail('Address', userProfile.address,
//                       'assets/icons/address.png'),
//                   buildProfileDetail('Phone Number', userProfile.phone,
//                       'assets/icons/phone.png'),
//                   buildProfileDetail('Designation', userProfile.designation,
//                       'assets/icons/posting.png'),
//                   buildProfileDetail('Birthdate', userProfile.dateBirth,
//                       'assets/icons/calendar.png'),
//                   buildProfileDetail(
//                       'Gender', userProfile.gender, 'assets/icons/gender.png'),
//                   buildProfileDetail('Bank Name', userProfile.bankName,
//                       'assets/icons/bank.png'),
//                   buildProfileDetail(
//                       'Bank RIB', userProfile.bankRIB, 'assets/icons/card.png'),
//                   buildProfileDetail('Social Security Number',
//                       userProfile.insuranceNumber, 'assets/icons/id_card.png'),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildProfileHeader(User userProfile) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: userProfile.photo.isNotEmpty
//                   ? NetworkImage(userProfile.photo)
//                   : const AssetImage(
//                       'assets/icons/employees.png'), // Placeholder image
//             ),
//             const SizedBox(width: 16),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${userProfile.firstName} ${userProfile.lastName}', // Ensure names are available
//                   style: TextStyle(
//                     fontFamily: AppConstants.fontApp,
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFE9E9E9),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.business_center_outlined,
//                           color: Color(0xFF767676), size: 16),
//                       SizedBox(width: 4),
//                       Text(
//                         userProfile.designation,
//                         style: TextStyle(
//                           color: Color(0xFF767676),
//                           fontSize: 14,
//                           fontFamily: AppConstants.fontApp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   userProfile.departmentId.toString(),
//                   style: TextStyle(
//                     fontFamily: AppConstants.fontApp,
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Color(0xFF15BE77),
//               Color(0xFF53E88B),
//             ]),
//             borderRadius: BorderRadius.circular(50),
//           ),
//           child: Center(
//             child: Text(
//               userProfile.status,
//               style: TextStyle(
//                 fontFamily: AppConstants.fontApp,
//                 color: Colors.black,
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildProfileDetail(String title, String value, String iconPath) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontFamily: AppConstants.fontApp,
//             ),
//           ),
//           SizedBox(height: 4),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: AppColors.appBar,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               children: [
//                 Image.asset(iconPath,
//                     color: AppColors.lightGreyColor,
//                     height: 24,
//                     width: 24), // Use Image.asset for PNGs
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     value,
//                     style: TextStyle(
//                       color: Color(0xFFA1A9B5),
//                       fontSize: 16,
//                       fontFamily: AppConstants.fontApp,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/data/models/user_model.dart';
import 'package:hrm_front/common/data/values/colors.dart';
import 'package:hrm_front/common/data/values/constants.dart';
import 'package:hrm_front/employee_app/features/profile/controller/profile_controller.dart';
import 'package:hrm_front/employee_app/widgets/custom_app_bar.dart';

class EmployeeProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  EmployeeProfilePage({super.key});

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
                        buildProfileDetail('Gender', userProfile.gender, 'assets/icons/gender.png'),
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
              backgroundImage: userProfile.photo.isNotEmpty
                  ? NetworkImage(userProfile.photo) as ImageProvider
                  : const AssetImage('assets/icons/employees.png'),
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
                      const Icon(Icons.business_center_outlined, color: Color.fromARGB(255, 0, 0, 0), size: 20),
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
                  'Role: ${userProfile.role}', // Display role
                  style: const TextStyle(
                    fontFamily: AppConstants.fontApp,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4), // Optional spacing
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
                    value.isNotEmpty ? value : 'Not provided', // Handle empty values
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
