import 'user.dart';

class Users {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> users;

  Users({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.users,
  });

  Users.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      users = List<User>();
      json['data'].forEach((v) {
        users.add(User.fromJson(v));
      });
    }
  }
}
