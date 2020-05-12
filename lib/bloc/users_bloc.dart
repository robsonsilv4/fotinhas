import 'dart:async';

import '../data/models/user.dart';
import '../data/repositories/users_repository.dart';

class UsersBloc {
  final UsersRepository repository;

  final _streamController = StreamController<List<User>>.broadcast();

  UsersBloc(this.repository);

  Stream<List<User>> get users => _streamController.stream;

  void fetchUsers() async {
    _streamController.add(await repository.getUsers());
  }

  void dispose() {
    _streamController.close();
  }
}
