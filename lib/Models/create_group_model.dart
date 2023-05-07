import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreateGroup {
  final String? groupId;
  final String userId;
  final String groupName;
  final String groupType;
  CreateGroup({
    this.groupId,
    required this.userId,
    required this.groupName,
    required this.groupType,
  });
  // final List<String> groupMembersMobile;
  // final List<String> groupMembersEmail;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'groupName': groupName,
      'groupType': groupType,
    };
  }

  factory CreateGroup.fromMap(Map<String, dynamic> map) {
    return CreateGroup(
      userId: map['userId'] as String,
      groupName: map['groupName'] as String,
      groupType: map['groupType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateGroup.fromJson(String source) => CreateGroup.fromMap(json.decode(source) as Map<String, dynamic>);
}
