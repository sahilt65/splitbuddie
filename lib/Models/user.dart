// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String mob;
  final String password;
  final String token;
  final List<String>? groupDetails;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.mob,
      required this.password,
      required this.token,
      required this.groupDetails});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'mob': mob,
      'password': password,
      'token': token,
      'groupDetails': groupDetails,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      mob: map['mob'] as String,
      password: map['password'] as String,
      token: map['token'] as String,
      groupDetails: map['groupDetails'] != null ? List<String>.from((map['groupDetails']) as List<String>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
