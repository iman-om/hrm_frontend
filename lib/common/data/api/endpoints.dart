class Endpoints {
  // Update this IP address as per your local setup
  static const String ipAddress = '10.0.2.2:8000'; // Use the correct IP for your local server

  // Base URL for API
  static const String baseUrl = 'http://$ipAddress/api';

  // Employee-related routes
  static String loginEmployee() => '$baseUrl/login';


  // Profile-related routes
  static String getUserProfile(int userId) => '$baseUrl/users/$userId';
}
