import "package:flutter/material.dart";



class AttendanceStatus extends StatelessWidget {
  final String count;
  final String status;

  const AttendanceStatus({super.key, 
    required this.count,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Text(
          status,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
