// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Friend {
  String name;
  String number;
  Friend({
    required this.name,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'number': number,
    };
  }

  factory Friend.fromMap(Map<String, dynamic> map) {
    return Friend(
      name: map['name'] as String,
      number: map['number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Friend.fromJson(String source) => Friend.fromMap(json.decode(source) as Map<String, dynamic>);
}
