import 'package:flutter/material.dart';

class EmployeeSummaryWidget extends StatelessWidget {
  final String employeeName;
  final String role;
  final String department;
  final String photoUrl; // For employee photo

  const EmployeeSummaryWidget({
    Key? key,
    required this.employeeName,
    required this.role,
    required this.department,
    required this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Color(0xFF1C1E24), // Background color as per your app palette
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(photoUrl), // Employee photo
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employeeName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Role: $role',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Department: $department',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
