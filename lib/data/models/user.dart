class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  String get username => '${this.firstName}_${this.lastName}'.toLowerCase();
}
