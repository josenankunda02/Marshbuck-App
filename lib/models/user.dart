class UserModel {
  final String email;
  final String name;
  final String username;

  UserModel({
    required this.name,
    required this.email,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'], username: json['username'], name: json['name']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'username': username,
      };
}
