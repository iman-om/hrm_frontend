
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hrm_front/common_features/data/values/colors.dart';
// import 'package:hrm_front/widgets/attendance_summary.dart';
// import 'package:hrm_front/widgets/custom_search_bar.dart';
// import 'package:hrm_front/widgets/employee_navbar.dart';
// import 'package:hrm_front/widgets/shortcut_button.dart';

// class ManagerHomePage extends StatelessWidget {
//   final _selectedIndex = 0.obs;

//    ManagerHomePage({super.key});

//   void _onItemTapped(int index) {
//     _selectedIndex.value = index;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> args = Get.arguments;

//     int userId = args['userId'];

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text(
//           "Hello Manager!",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         toolbarHeight: 80.0,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               backgroundColor: Colors.black,
//               child: Icon(Icons.person, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           gradient: AppColors.gradientBackground,
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Search Bar
//               CustomSearchBar(
//                 onAddPressed: () {
//                 },
//               ),
//               // Attendance Header with "View" Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'ATTENDANCE',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to Attendance Detail Screen
//                       // Example: Get.to(() => AttendanceDetailScreen());
//                     },
//                     child: const Text(
//                       'view',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ],
//               ),

//               // Attendance Summary
//               const AttendanceSummary(),
//               const SizedBox(height: 20),

//               // Shortcuts Section
//               const Text(
//                 'SHORTCUTS',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // Shortcuts Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ShortcutButton(
//                     title: 'My Profile',
//                     icon: Icons.person,
//                     onTap: () {
//                       // Navigate to Employee Profile Page using GetX
//                       Get.to(() => ManagerHomePage(), arguments: {'userId': userId});

//                     },
//                   ),
//                   ShortcutButton(
//                     title: 'Request a leave',
//                     icon: Icons.assignment,
//                      onTap: () {
//                     // Navigate to Request Leave Screen
//                     // Get.to(() => RequestLeaveScreen());
//                     },
//                   ),
//                   ShortcutButton(
//                     title: 'Company Directory',
//                     icon: Icons.contact_page,
//                      onTap: () {
//                     //   // Navigate to Company Directory Screen
//                     //   // Get.to(() => CompanyDirectoryScreen());
//                      },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       // Bottom Navigation Bar
//       bottomNavigationBar: Obx(() => EmployeeBottomNavigationBar(
//             selectedIndex: _selectedIndex.value,
//             onItemSelected: _onItemTapped,
//           )),
//     );
//   }
// }
