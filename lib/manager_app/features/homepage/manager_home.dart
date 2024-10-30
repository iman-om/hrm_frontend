// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hrm_front/manager_app/features/homepage/widgets/employee_list.dart';
// import 'package:hrm_front/manager_app/widgets/manager_navbar.dart';
// import 'package:hrm_front/widgets/attendance_summary.dart';
// import 'package:hrm_front/widgets/custom_search_bar.dart';
// import 'package:hrm_front/common/data/values/colors.dart';
// import 'package:hrm_front/widgets/shortcut_button.dart';

// class ManagerHomePage extends StatefulWidget {
//   const ManagerHomePage({super.key});

//   @override
//   _ManagerHomePageState createState() {
//     return _ManagerHomePageState();
//   }
// }

// class _ManagerHomePageState extends State<ManagerHomePage> {
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
//               "Hello Manager!",
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
//                     'Employee List',
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black), // Adjusted text color
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to Attendance Detail Screen
//                       // Example: Get.to(() => EmployeeDetailScreen());
//                     },
//                     child: Text(
//                       'view All',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ],
//               ),

//               // Employee Summary
//               Row(
//                 children: [
//                   const EmployeeSummaryWidget(employeeName: '', role: '', department: '', attendanceDays: 4,  photoUrl: '',),
//                   const EmployeeSummaryWidget(employeeName: '', role: '', department: '', attendanceDays: 4,  photoUrl: '',),
//                   const EmployeeSummaryWidget(employeeName: '', role: '', department: '', attendanceDays: 4,  photoUrl: '',),
//                 ],
//               ),

//               SizedBox(height: 20),

//               // Shortcuts Section
//               Text(
//                 'SHORTCUTS',
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black), // Adjusted text color
//               ),
//               SizedBox(height: 10),

//               // Shortcuts Row
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     ShortcutButton(
//               //       title: 'My Profile',
//               //       icon: Icons.person,
//               //       onTap: () {
//               //         print("Navigating to Manager Profile..."); // Check if this prints

//               //         Get.toNamed('/manager_profile');
//               //       },
//               //     ),
//               //     ShortcutButton(
//               //         title: 'Request a leave', icon: Icons.assignment, onTap: () {  },),
//               //     ShortcutButton(
//               //         title: 'Company Directory', icon: Icons.contact_page, onTap: () {  },),
//               //   ],
//               // ),
//             ],
//           ),
//         ),
//       ),
//       // Bottom Navigation Bar
//       bottomNavigationBar: ManagerBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemSelected: _onItemTapped,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/manager_app/features/homepage/widgets/Shortcuts.dart';
import 'package:hrm_front/manager_app/features/homepage/widgets/employee_list.dart';
import 'package:hrm_front/manager_app/widgets/manager_navbar.dart';
import 'package:hrm_front/widgets/attendance_summary.dart';
import 'package:hrm_front/widgets/custom_search_bar.dart';
import 'package:hrm_front/common/data/values/colors.dart';

class ManagerHomePage extends StatefulWidget {
  const ManagerHomePage({super.key});

  @override
  _ManagerHomePageState createState() {
    return _ManagerHomePageState();
  }
}

class _ManagerHomePageState extends State<ManagerHomePage> {
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
          "Hello Manager!",
          style: const TextStyle(color: Colors.white),
        ), // Dynamically display the user's first name
        backgroundColor: Colors.black,
        toolbarHeight: 80.0,
        actions: const [
          Padding(
          padding: EdgeInsets.all(8.0),
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
                    'Employee List',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black), // Adjusted text color
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Attendance Detail Screen
                      // Example: Get.to(() => EmployeeDetailScreen());
                    },
                    child: Text(
                      'view All',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),

              // Horizontal scrollable Employee Summary
              SizedBox(
                height: 150, // Adjust height according to your widget size
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Enables horizontal scrolling
                  child: Row(
                    children: const [
                      EmployeeSummaryWidget(
                        employeeName: 'John Doe',
                        role: 'Software Engineer',
                        department: 'IT',
                        photoUrl:'assets/images/woman.png' ,
                      ),
                      SizedBox(width: 16), // Spacing between employee widgets
                      EmployeeSummaryWidget(
                        employeeName: 'Jane Smith',
                        role: 'Project Manager',
                        department: 'Operations',
                        photoUrl:'assets/images/woman.png' ,
                      ),
                      SizedBox(width: 16),
                      EmployeeSummaryWidget(
                        employeeName: 'Alice Johnson',
                        role: 'HR Manager',
                        department: 'Human Resources',
                        photoUrl:'assets/images/woman.png' ,
                      ),
                      // Add more EmployeeSummaryWidgets as needed
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Shortcuts Section
              Text(
                'SHORTCUTS',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black), // Adjusted text color
              ),
              SizedBox(height: 10),

              // Add ShortcutsWidget here
      ShortcutsWidget(
      numberOfDepartments: 5,
      numberOfEmployees: 120,
        companyPolicy: "Updated Sept 10",
        latestContracts: "3 new contracts",
      ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: ManagerBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
