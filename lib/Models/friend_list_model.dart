// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:splitbuddie/Models/friend_model.dart';

class FriendList {
  String userId;
  List<Friend> friendList;
  FriendList({
    required this.userId,
    required this.friendList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'friendList': friendList.map((x) => x.toMap()).toList(),
    };
  }

  factory FriendList.fromMap(Map<String, dynamic> map) {
    print("Sahil");
    print(map["_id"]);
    return FriendList(
      userId: map['userId'] as String,
      friendList: List<Friend>.from(
        (map['friendList'] as List<int>).map<Friend>(
          (x) => Friend.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FriendList.fromJson(String source) {
    print("Printing Source : " + source);
    return FriendList.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}
