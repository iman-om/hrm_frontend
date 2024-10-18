// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hrm_front/common_features/data/values/colors.dart';
// import 'package:hrm_front/widgets/attendance_summary.dart';
// import 'package:hrm_front/widgets/custom_search_bar.dart';
// import 'package:hrm_front/widgets/employee_navbar.dart';
// import 'package:hrm_front/widgets/shortcut_button.dart';

// class EmployeeHomePage extends StatefulWidget {
//   @override
//   _EmployeeHomePageState createState() => _EmployeeHomePageState();
// }

// class _EmployeeHomePageState extends State<EmployeeHomePage> {
//   int _selectedIndex = 0; // Initialize selected index

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       // You can add navigation logic here based on the selected index
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text(
//               "Hello Employee!",
//               style: const TextStyle(color: Colors.white),
//             ), // Dynamically display the user's first name
//         backgroundColor: Colors.black,
//         toolbarHeight: 80.0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
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
//         decoration: BoxDecoration(
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
//                   print('Add button pressed');
//                 },
//               ),
//               // Attendance Header with "View" Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'ATTENDANCE',
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white), // Adjusted text color
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to Attendance Detail Screen
//                       // Example: Get.to(() => AttendanceDetailScreen());
//                     },
//                     child: Text(
//                       'view',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ],
//               ),

//               // Attendance Summary
//               AttendanceSummary(),
//               SizedBox(height: 20),

//               // Shortcuts Section
//               Text(
//                 'SHORTCUTS',
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white), // Adjusted text color
//               ),
//               SizedBox(height: 10),

//               // Shortcuts Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ShortcutButton(title: 'My Profile', icon: Icons.person),
//                   ShortcutButton(
//                       title: 'Request a leave', icon: Icons.assignment),
//                   ShortcutButton(
//                       title: 'Company Directory', icon: Icons.contact_page),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       // Bottom Navigation Bar
//       bottomNavigationBar: EmployeeBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemSelected: _onItemTapped,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/data/values/colors.dart';
import 'package:hrm_front/employee_app/widgets/employee_navbar.dart';
import 'package:hrm_front/widgets/attendance_summary.dart';
import 'package:hrm_front/widgets/custom_search_bar.dart';
import 'package:hrm_front/widgets/shortcut_button.dart';

class EmployeeHomePage extends StatefulWidget {
  @override
  _EmployeeHomePageState createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {
  int _selectedIndex = 0; // Initialize selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // You can add navigation logic here based on the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
              "Hello Employee!",
              style: const TextStyle(color: Colors.white),
            ), // Dynamically display the user's first name
        backgroundColor: Colors.black,
        toolbarHeight: 80.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              CustomSearchBar(
                onAddPressed: () {
                  print('Add button pressed');
                },
              ),
              // Attendance Header with "View" Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ATTENDANCE',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white), // Adjusted text color
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Attendance Detail Screen
                      // Example: Get.to(() => AttendanceDetailScreen());
                    },
                    child: Text(
                      'view',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),

              // Attendance Summary
              AttendanceSummary(),
              SizedBox(height: 20),

              // Shortcuts Section
              Text(
                'SHORTCUTS',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white), // Adjusted text color
              ),
              SizedBox(height: 10),

              // Shortcuts Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShortcutButton(title: 'My Profile', icon: Icons.person, onTap: () {  Get.toNamed(
                      '/employee_profile'); },),
                  ShortcutButton(
                      title: 'Request a leave', icon: Icons.assignment, onTap: () {  },),
                  ShortcutButton(
                      title: 'Company Directory', icon: Icons.contact_page, onTap: () {  },),
                ],
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: EmployeeBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}