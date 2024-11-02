import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'endpoints.dart';

class UserApi {
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('${Endpoints.baseUrl}/users'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['data'];
        List<User> users =
            data.map<User>((user) => User.fromJson(user)).toList();

        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (error) {
      print('Error fetching users: $error');
      throw error;
    }
  }
}
