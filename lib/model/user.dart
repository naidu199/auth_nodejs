import 'dart:convert';

class User {
  final String id;
  final String email;
  final String username;
  final String token;
  final String password;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.username,
      required this.token});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'password': password,
      'username': username,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      username: map['username'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
