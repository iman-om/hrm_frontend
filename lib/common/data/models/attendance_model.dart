class Attendance {
  final int id;
  final String status;
  final String date;
  final int userId;

  Attendance({
    required this.id,
    required this.status,
    required this.date,
    required this.userId,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'],
      status: json['status'],
      date: json['date'],
      userId: json['user_id'],
    );
  }
}
