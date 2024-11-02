class Endpoints {
  static const String ipAddress = '10.0.2.2:8000';

  static const String baseUrl = 'http://$ipAddress/api';

  static String loginEmployee() => '$baseUrl/login';

  static String getUserProfile(int userId) => '$baseUrl/users/$userId';
  static String updateUserProfile(int userId) => '$baseUrl/users/$userId';

  static String getEmployees() => '$baseUrl/users';
}
