import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/manager_app/features/employees_detail/controller/employee_details_controller.dart';



class AddEmployeePage extends StatelessWidget {
  final EmployeeController employeeController = Get.find();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController photoUrlController = TextEditingController();

  AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Employee'),
        backgroundColor: Colors.grey[850],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: designationController,
                decoration: InputDecoration(
                  labelText: 'Designation',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: departmentController,
                decoration: InputDecoration(
                  labelText: 'Department ID', // Clarified to Department ID
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number, // Ensure only number input is allowed
              ),
              SizedBox(height: 16),
              TextField(
                controller: photoUrlController,
                decoration: InputDecoration(
                  labelText: 'Photo URL',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  String firstName = firstNameController.text.trim();
                  String lastName = lastNameController.text.trim();
                  String designation = designationController.text.trim();
                  int departmentId = int.tryParse(departmentController.text.trim()) ?? 0; // Default to 0 if parsing fails
                  String photoUrl = photoUrlController.text.trim();
        
                  if (firstName.isNotEmpty && lastName.isNotEmpty && departmentId > 0) {
                    employeeController.addEmployee(
                      firstName: firstName,
                      lastName: lastName,
                      designation: designation,
                      departmentId: departmentId, // Pass the integer departmentId
                      photoUrl: photoUrl, email: '', address: '', phone: '', gender: true, bankName: '', bankRIB: '', insuranceNumber: '', dateOfBirth: '',
                    );
        
                    // Go back to the Employee Details Page
                    Get.back();
                  } else {
                    // Show an error message if required fields are empty or departmentId is invalid
                    Get.snackbar('Error', 'First and last name are required, and department ID must be valid',
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: Text('Add Employee'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
