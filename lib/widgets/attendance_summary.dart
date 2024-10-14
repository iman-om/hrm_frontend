import 'package:flutter/material.dart';
import 'package:hrm_front/widgets/attendance_statue.dart';

class AttendanceSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AttendanceStatus(count: '26', status: 'Present'),
          AttendanceStatus(count: '3', status: 'Absent'),
          AttendanceStatus(count: '1', status: 'Late'),
        ],
      ),
    );
  }
}
