import '../models/user.dart';

class MemoryProvider {
  List<User> getAllUsers() {
    return [
      User(firstName: 'Robson', lastName: 'Silva'),
      User(firstName: 'Zarathon', lastName: 'Maia'),
      User(firstName: 'Siqueira', lastName: 'Júnior'),
      User(firstName: 'Mikael', lastName: 'Matos'),
      User(firstName: 'Emerson', lastName: 'Vieira'),
      User(firstName: 'Francisco', lastName: 'Gerlison'),
    ];
  }
}
