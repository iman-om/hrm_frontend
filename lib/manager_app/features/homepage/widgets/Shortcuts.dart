import 'package:flutter/material.dart';

class ShortcutsWidget extends StatelessWidget {
  final int numberOfDepartments;
  final int numberOfEmployees;
  final String companyPolicy;
  final String latestContracts;

  const ShortcutsWidget({
    Key? key,
    required this.numberOfDepartments,
    required this.numberOfEmployees,
    required this.companyPolicy,
    required this.latestContracts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildShortcutCard(
                  title: "Departments",
                  value: numberOfDepartments.toString(),
                  icon: Icons.apartment,
                ),
              ),
              const SizedBox(width: 16), 
              Expanded(
                child: _buildShortcutCard(
                  title: "Employees",
                  value: numberOfEmployees.toString(),
                  icon: Icons.people,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: _buildShortcutCard(
                  title: "Company Policy",
                  value: companyPolicy,
                  icon: Icons.policy,
                ),
              ),
              const SizedBox(width: 16), 
              Expanded(
                child: _buildShortcutCard(
                  title: "Latest Contracts",
                  value: latestContracts,
                  icon: Icons.description,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShortcutCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      elevation: 8, 
      color: Colors.grey[850], 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), 
      ),
      child: InkWell( 
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.white),
              const SizedBox(height: 8.0),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                 ],
               ),
              const SizedBox(height: 4.0),

                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white70, 
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),

            ],
          ),
        ),
      ),
    );
  }
}

