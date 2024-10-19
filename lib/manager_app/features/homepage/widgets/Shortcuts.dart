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
          // First Row (Departments, Employees)
          Row(
            children: [
              Expanded(
                child: _buildShortcutCard(
                  title: "Departments",
                  value: numberOfDepartments.toString(),
                  icon: Icons.apartment,
                ),
              ),
              const SizedBox(width: 16), // Add spacing between cards
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
          // Second Row (Company Policy, Latest Contracts)
          Row(
            children: [
              Expanded(
                child: _buildShortcutCard(
                  title: "Company Policy",
                  value: companyPolicy,
                  icon: Icons.policy,
                ),
              ),
              const SizedBox(width: 16), // Add spacing between cards
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

  // Helper function to build each shortcut card
  Widget _buildShortcutCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      elevation: 8, // Adds shadow for depth
      color: Colors.grey[850], // Darker grey for better contrast
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // More rounded corners
      ),
      child: InkWell( // Adds tap effect
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          // Define tap action if needed
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
                    color: Colors.white70, // Lighter text color for value
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

