import '../models/user.dart';
import '../providers/remote_provider.dart';

class UsersRepository {
  final RemoteProvider remoteProvider;

  UsersRepository(this.remoteProvider);

  Future<List<User>> getUsers() async {
    final response = await remoteProvider.fetchUsers();
    return response.users;
  }
}
