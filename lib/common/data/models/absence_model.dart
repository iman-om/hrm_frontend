class Absence {
  final int id;
  final String date;
  final String reason;
  final int userId;

  Absence({
    required this.id,
    required this.date,
    required this.reason,
    required this.userId,
  });

  factory Absence.fromJson(Map<String, dynamic> json) {
    return Absence(
      id: json['id'],
      date: json['date'],
      reason: json['reason'],
      userId: json['user_id'],
    );
  }
}
