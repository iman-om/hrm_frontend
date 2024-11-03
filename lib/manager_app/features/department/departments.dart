import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_front/common/data/values/colors.dart';
import 'package:hrm_front/common/data/models/emlpyees_model.dart';
import 'package:hrm_front/widgets/gradient_button%20copy.dart';

// class Employee {
//   final String firstName;
//   final String lastName;
//   final String designation;

//   Employee({
//     required this.firstName,
//     required this.lastName,
//     required this.designation,
//   });

//   String get fullName => '$firstName $lastName';
// }

class Department {
  final String id;
  final String name;
  final List<Employee> employees;

  Department({
    required this.id,
    required this.name,
    this.employees = const [],
  });
}

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({super.key});

  @override
  _DepartmentsPageState createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  List<Department> departments = [
    Department(id: '1', name: 'Human Resources', employees: [
      Employee(
        firstName: 'Diana',
        lastName: 'Prince',
        email: 'diana@example.com',
        address: '123 Maple St, Themyscira',
        phone: '5678901234',
        designation: 'HR',
        departmentId: 1,
        gender: false,
        bankName: 'tuv',
        bankRIB: 'wxy789',
        insuranceNumber: '3456789012',
        dateOfBirth: '1995-03-14',
        status: true,
        photoUrl: 'assets/images/woman3.jpg',
      ),
      Employee(
        firstName: 'Imane',
        lastName: 'Omari',
        email: 'imane3.omari@gmail.com',
        address: '123 user St, User City',
        phone: '0555555555',
        designation: 'Mobile Developer',
        departmentId: 1,
        gender: true,
        bankName: 'Natixis Banque',
        bankRIB: 'cle',
        insuranceNumber: '222222',
        dateOfBirth: '2001-06-15',
        status: true,
        photoUrl: 'assets/images/woman.jpg',
      ),
    ]),
    Department(id: '2', name: 'Engineering', employees: [
      Employee(
        firstName: 'Eve',
        lastName: 'Miller',
        email: 'eve@example.com',
        address: '234 Pine St, National City',
        phone: '6789012345',
        designation: 'Engineer',
        departmentId: 2,
        gender: false,
        bankName: 'xyz',
        bankRIB: 'abc789',
        insuranceNumber: '6789012345',
        dateOfBirth: '1989-01-05',
        status: true,
        photoUrl: 'assets/images/woman4.jpg',
      ),
      Employee(
        firstName: 'John',
        lastName: 'Doe',
        email: 'johndoe@example.com',
        address: '456 Main St, Springfield',
        phone: '0987654321',
        designation: 'Developer',
        departmentId: 2,
        gender: true,
        bankName: 'xyz',
        bankRIB: 'abc123',
        insuranceNumber: '987654321',
        dateOfBirth: '1992-07-23',
        status: true,
        photoUrl: 'assets/images/man4.jpg',
      ),
    ]),
    Department(id: '3', name: 'IT', employees: [
      Employee(
        firstName: 'Frank',
        lastName: 'Wright',
        email: 'frank@example.com',
        address: '345 Birch St, Smallville',
        phone: '7890123456',
        designation: 'Architect',
        departmentId: 3,
        gender: true,
        bankName: 'uvw',
        bankRIB: 'def012',
        insuranceNumber: '7890123456',
        dateOfBirth: '1987-08-19',
        status: true,
        photoUrl: 'assets/images/man4.jpg',
      ),
      Employee(
        firstName: 'Jane',
        lastName: 'Doe',
        email: 'janedoe@example.com',
        address: '789 Elm St, Metropolis',
        phone: '1239876543',
        designation: 'Manager',
        departmentId: 3,
        gender: false,
        bankName: 'bcd',
        bankRIB: 'def456',
        insuranceNumber: '456123789',
        dateOfBirth: '1988-11-15',
        status: true,
        photoUrl: 'assets/images/woman1.jpg',
      ),
    ]),
    Department(id: '4', name: 'Marketing', employees: [
      Employee(
        firstName: 'Charlie',
        lastName: 'Davis',
        email: 'charlie@example.com',
        address: '789 Willow St, Central City',
        phone: '4567890123',
        designation: 'Intern',
        departmentId: 4,
        gender: true,
        bankName: 'nop',
        bankRIB: 'qrs456',
        insuranceNumber: '2345678901',
        dateOfBirth: '1997-12-25',
        status: true,
        photoUrl: 'assets/images/man1.jpg',
      ),
      Employee(
        firstName: 'Alice',
        lastName: 'Smith',
        email: 'alice@example.com',
        address: '123 Oak St, Gotham',
        phone: '2345678901',
        designation: 'Data Analyst',
        departmentId: 4,
        gender: false,
        bankName: 'efg',
        bankRIB: 'ghi789',
        insuranceNumber: '123456000',
        dateOfBirth: '1990-06-10',
        status: true,
        photoUrl: 'assets/images/woman2.jpg',
      ),
    ]),
    Department(id: '5', name: 'Customer Support', employees: [
      Employee(
        firstName: 'Bob',
        lastName: 'Brown',
        email: 'bob@example.com',
        address: '456 Cedar St, Star City',
        phone: '3456789012',
        designation: 'Consultant',
        departmentId: 5,
        gender: true,
        bankName: 'hij',
        bankRIB: 'klm123',
        insuranceNumber: '0987654321',
        dateOfBirth: '1985-04-08',
        status: true,
        photoUrl: 'assets/images/man2.jpg',
      ),
    ]),
  ];

  void _addDepartment(String name) {
    final newDepartment = Department(
      id: (departments.length + 1).toString(),
      name: name,
    );
    setState(() {
      departments.add(newDepartment);
    });
  }

  void _editDepartment(int index, String newName) {
    setState(() {
      departments[index] = Department(
        id: departments[index].id,
        name: newName,
        employees: departments[index].employees,
      );
    });
  }

  void _deleteDepartment(int index) {
    setState(() {
      departments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Departments",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        child: Column(
          children: [
            // Button to add a department
            GradientButton(
              text: 'Add Department',
              width: 250,
              height: 50,
              onTap: () {
                _showAddDepartmentDialog();
              },
            ),
            const SizedBox(height: 20),
            // List of departments
            Expanded(
              child: ListView.builder(
                itemCount: departments.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 5, // Added shadow effect
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        departments[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600, // Bold font
                        ),
                      ),
                      onTap: () => _showEmployeesDialog(departments[index]),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Edit') {
                            _showEditDepartmentDialog(index);
                          } else if (value == 'Delete') {
                            _deleteDepartment(index);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'Edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'Delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEmployeesDialog(Department department) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Employees in ${department.name}"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: department.employees.length,
              itemBuilder: (context, index) {
                final employee = department.employees[index];
                return ListTile(
                  title: Text(
                    '${employee.firstName} ${employee.lastName}',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(employee.designation),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(employee.photoUrl), // Use employee photo
                    radius: 20,
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _showAddDepartmentDialog() {
    String newDepartment = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Department"),
          content: TextField(
            onChanged: (value) {
              newDepartment = value;
            },
            decoration: const InputDecoration(hintText: "Department Name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newDepartment.isNotEmpty) {
                  _addDepartment(newDepartment);
                }
                Get.back();
              },
              child: const Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _showEditDepartmentDialog(int index) {
    String updatedDepartment = departments[index].name;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Department"),
          content: TextField(
            onChanged: (value) {
              updatedDepartment = value;
            },
            controller: TextEditingController(text: updatedDepartment),
            decoration: const InputDecoration(hintText: "Department Name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (updatedDepartment.isNotEmpty) {
                  _editDepartment(index, updatedDepartment);
                }
                Get.back();
              },
              child: const Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}