// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:splitbuddie/Models/friend_model.dart';

class Group {
  String adminUserId;
  String groupId;
  String groupName;
  String groupType;
  List<Friend> groupMembers;
  Group({
    required this.adminUserId,
    required this.groupId,
    required this.groupName,
    required this.groupType,
    required this.groupMembers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adminUserId': adminUserId,
      'groupId': groupId,
      'groupName': groupName,
      'groupType': groupType,
      'groupMembers': groupMembers.map((x) => x.toMap()).toList(),
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      adminUserId: map['adminUserId'] as String,
      groupId: map['groupId'] as String,
      groupName: map['groupName'] as String,
      groupType: map['groupType'] as String,
      groupMembers: List<Friend>.from(
        (map['groupMembers'] as List<int>).map<Friend>(
          (x) => Friend.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Group.fromJson(String source) {
    print("Prointing : " + source);
    print("Prointing : " + source.runtimeType.toString());
    print("Prointing : " + source[0]);
    print("Prointing : " + source[1]);
    print("Prointing : " + source[2]);

    return Group.fromMap(jsonEncode(source) as Map<String, dynamic>);
  }
}
