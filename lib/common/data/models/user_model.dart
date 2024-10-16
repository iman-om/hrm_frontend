class User {
  final int id;
  final bool isAdmin;
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String phone;
  final String designation;
  final int departmentId;
  final String gender;
  final String bankName;
  final String bankRIB;
  final String insuranceNumber;
  final String dateBirth;
  final int hrmConfigId;
  final String photo;
  final String status;
  final String role;
  // Constructor
  User({
    required this.id,
    required this.isAdmin,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.phone,
    required this.designation,
    required this.departmentId,
    required this.gender,
    required this.bankName,
    required this.bankRIB,
    required this.insuranceNumber,
    required this.dateBirth,
    required this.hrmConfigId,
    required this.photo,
    required this.status,
    required this.role,
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,  
      isAdmin: json['is_admin'] ?? false,  
      firstName: json['first_name'] ?? '',  
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      designation: json['designation'] ?? '',
      departmentId: json['department_id'] ?? 0,  
      gender: json['gender'] ?? '',
      bankName: json['bank_name'] ?? '',
      bankRIB: json['bank_RIB'] ?? '',
      insuranceNumber: json['insurance_number'] ?? '',
      dateBirth: json['date_birth'] ?? '',
      hrmConfigId: json['hrm_config_id'] ?? 0,  
      photo: json['photo'] ?? '',  
      status: json['status'] ?? '', 
      role: '', 
    );
  }

  // Convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_admin': isAdmin,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'address': address,
      'phone': phone,
      'designation': designation,
      'department_id': departmentId,
      'gender': gender,
      'bank_name': bankName,
      'bank_RIB': bankRIB,
      'insurance_number': insuranceNumber,
      'date_birth': dateBirth,
      'hrm_config_id': hrmConfigId,
      'photo': photo,
      'status': status,
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
