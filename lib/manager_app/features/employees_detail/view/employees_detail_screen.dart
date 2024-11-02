import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/manager_app/features/employees_detail/controller/employee_details_controller.dart';

class EmployeeDetailsPage extends StatelessWidget {
  final EmployeeController employeeController = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[850],
      ),
      body: Obx(
        () {
          if (employeeController.employees.isEmpty) {
            return Center(
              child: Text(
                'No employees found',
                style: TextStyle(color: Colors.white70),
              ),
            );
          }

          return ListView.builder(
            itemCount: employeeController.employees.length,
            itemBuilder: (context, index) {
              final employee = employeeController.employees[index];
              print('Loading image from: ${employee.photoUrl}');

              return Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Color(0xFF1C1E24),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(employee.photoUrl),
                  ),
                  title: Text(
                    '${employee.firstName} ${employee.lastName}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Designation: ${employee.designation}',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        'Department: ${employee.departmentId}',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    // Implement navigation to detailed employee page if required
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
