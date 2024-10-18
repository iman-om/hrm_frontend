//import 'dart:convert';
//import 'package:hrm_front/common/data/models/user_model.dart';
//import 'package:http/http.dart' as http;

//class ProfileApi {
 // final String baseUrl = 'https://f4b6-105-235-128-52.ngrok-free.app/api/users/82';

  //Future<User> getUserProfile(int userId, String token) async {
    //final url = '$baseUrl/$userId';

    //try {
     // final response = await http.get(
       // Uri.parse(url),
       // headers: {
        //  'Authorization': 'Bearer $token',
          //'Accept': 'application/json',
        //},
      //);

      //if (response.statusCode == 200) {
        //final data = json.decode(response.body);
        //return User.fromJson(data);
      //} else if (response.statusCode == 401) {
      //  throw Exception('Unauthorized access. Please log in again.');
      //} else if (response.statusCode == 404) {
        //throw Exception('User not found.');
      //} else {
        //throw Exception('Failed to load user profile. Error code: ${response.statusCode}');
      //}
    //} catch (e) {
      //throw Exception('Error fetching user profile: $e');
    //}}}
