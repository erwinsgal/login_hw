import 'dart:convert';
import 'package:login_page_hw/model/profile.dart';
import 'package:http/http.dart' as http;

class ProfileProvider {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<Profile> fetchProfile() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load profile");
    }
  }
}
