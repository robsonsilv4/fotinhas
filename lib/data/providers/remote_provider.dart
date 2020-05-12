import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/constants.dart';
import '../models/users.dart';

class RemoteProvider {
  final _client = http.Client();

  Future<Users> fetchUsers() async {
    final response = await _client.get(Constants.usersURL);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Users.fromJson(json);
    } else {
      throw Exception('Ocorreu um erro ao caregar os usuários.');
    }
  }
}
