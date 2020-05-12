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

  String get username => '${this.firstName}_${this.lastName}'.toLowerCase();
}
