
class User {
  final int id; 
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String phone;
  //final Bool gender;
  final String designation;
  final int departmentId; 
  final String bankName;
  final String bankRIB;
  final String insuranceNumber;
  final String dateBirth;
  final String? hrmConfigId; 
  final String? photo; 
  final int status; 
  String role;


  // Constructor
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.phone,
    //required this.gender,
    required this.designation,
    required this.departmentId,
    required this.bankName,
    required this.bankRIB,
    required this.insuranceNumber,
    required this.dateBirth,
    this.hrmConfigId, // Nullable
    this.photo, // Nullable
    required this.status,
    this.role = 'employee',
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      // Handle null case by providing default value
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      //gender: json['gender'] ?? '',
      designation: json['designation'] ?? '',
      departmentId: json['department_id'] ?? 0,
      bankName: json['bank_name'] ?? '',
      bankRIB: json['bank_RIB'] ?? '',
      insuranceNumber: json['insurance_number'] ?? '',
      dateBirth: json['date_birth'] ?? '',
      hrmConfigId: json['hrm_config_id'],
      photo: json['photo'],
      // Nullable
      status: json['status'] ?? 0,
      // Handle as int
      role: json['role'] ?? 'employee',
    );
  }

  // Convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'address': address,
      'phone': phone,
      'designation': designation,
      'department_id': departmentId,
      'bank_name': bankName,
      'bank_RIB': bankRIB,
      'insurance_number': insuranceNumber,
      'date_birth': dateBirth,
      'hrm_config_id': hrmConfigId,
      'photo': photo,
      'status': status,
      'role': role,
    };
  }
}


// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? phone;
//   String? designation;

//   User({this.id, this.firstName, this.lastName, this.email, this.phone, this.designation});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       email: json['email'],
//       phone: json['phone'],
//       designation: json['designation'],
//     );
//   }
// }
