import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/users.dart';

class RemoteProvider {
  final _client = http.Client();

  Future<Users> fetchUsers() async {
    final response = await _client.get('https://reqres.in/api/users');
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Users.fromJson(json);
    } else {
      throw Exception('Ocorreu um erro ao caregar os usuários.');
    }
  }
}
