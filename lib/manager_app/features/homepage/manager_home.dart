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
import 'package:hrm_front/manager_app/features/employees_detail/view/employees_detail_screen.dart';
import 'package:hrm_front/manager_app/features/homepage/widgets/Shortcuts.dart';
import 'package:hrm_front/manager_app/features/homepage/widgets/employee_list.dart';
import 'package:hrm_front/manager_app/widgets/manager_navbar.dart';
import 'package:hrm_front/manager_app/widgets/sidebar_menu.dart';
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
  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Hello Manager",
          style: TextStyle(color: Colors.white),
        ), 
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
      drawer: SidebarMenu(),

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Employee List',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black), 
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => EmployeeDetailsPage());
                    },
                    child: const Text(
                      'view All',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 150, 
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, 
                  child: Row(
                    children: [
                      EmployeeSummaryWidget(
                        employeeName: 'John Doe',
                        role: 'developer',
                        department: '2',
                        photoUrl: 'assets/images/man4.jpg',
                      ),
                      SizedBox(width: 16),
                       EmployeeSummaryWidget(
                        employeeName: 'Alice Smith',
                        role: 'Data Analyst',
                        department: '4',
                        photoUrl: 'assets/images/woman2.jpg',
                      ),
                      SizedBox(width: 16),
                      EmployeeSummaryWidget(
                        employeeName: 'Bob Brown',
                        role: 'consultant',
                        department: '5',
                        photoUrl: 'assets/images/man2.jpg',
                      ),
                      SizedBox(width: 16),
                      EmployeeSummaryWidget(
                        employeeName: 'Charlie Davis',
                        role: 'intern',
                        department: '4',
                        photoUrl: 'assets/images/man1.jpg',
                      ),
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
                    color: Colors.black), 
              ),
              SizedBox(height: 10),

              ShortcutsWidget(
                numberOfDepartments: 5,
                numberOfEmployees: 10,
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
