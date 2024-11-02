import 'package:flutter/material.dart';
import 'package:hrm_front/common/data/values/colors.dart';

class PoliciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Company Policies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        child: ListView(
          children: [
            SectionHeader(title: 'Leave Policies'),
            PolicyItem(
              title: 'Annual Leave',
              description:
                  'Employees are entitled to 20 days of paid annual leave per year.',
            ),
            PolicyItem(
              title: 'Sick Leave',
              description:
                  'Employees are entitled to 10 days of paid sick leave per year.',
            ),
            PolicyItem(
              title: 'Maternity Leave',
              description:
                  'Maternity leave of up to 12 weeks is available for eligible employees.',
            ),
            SectionHeader(title: 'Code of Conduct'),
            PolicyItem(
              title: 'Professional Behavior',
              description:
                  'Employees are expected to conduct themselves professionally at all times.',
            ),
            PolicyItem(
              title: 'Anti-Discrimination Policy',
              description:
                  'The company is committed to providing a work environment free of discrimination.',
            ),
            SectionHeader(title: 'Workplace Safety'),
            PolicyItem(
              title: 'Emergency Procedures',
              description:
                  'Employees must be familiar with emergency procedures and exits in the workplace.',
            ),
            PolicyItem(
              title: 'Reporting Hazards',
              description:
                  'Employees should report any hazards or unsafe conditions to their supervisor immediately.',
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor, // Changed to black
        ),
      ),
    );
  }
}

class PolicyItem extends StatelessWidget {
  final String title;
  final String description;

  const PolicyItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor, // Use defined black color
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.blackColor.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
