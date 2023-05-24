// To parse this JSON data, do
//
//     final groups = groupsFromJson(jsonString);

import 'dart:convert';

List<Groups> groupsFromJson(String str) => List<Groups>.from(json.decode(str).map((x) => Groups.fromJson(x)));

String groupsToJson(List<Groups> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Groups {
    String? id;
    String? adminUserId;
    String? groupId;
    String? groupName;
    String? groupType;
    List<GroupMember>? groupMembers;
    int? v;

    Groups({
        this.id,
        this.adminUserId,
        this.groupId,
        this.groupName,
        this.groupType,
        this.groupMembers,
        this.v,
    });

    factory Groups.fromJson(Map<String, dynamic> json) => Groups(
        id: json["_id"],
        adminUserId: json["adminUserId"],
        groupId: json["groupId"],
        groupName: json["groupName"],
        groupType: json["groupType"],
        groupMembers: json["groupMembers"] == null ? [] : List<GroupMember>.from(json["groupMembers"]!.map((x) => GroupMember.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "adminUserId": adminUserId,
        "groupId": groupId,
        "groupName": groupName,
        "groupType": groupType,
        "groupMembers": groupMembers == null ? [] : List<dynamic>.from(groupMembers!.map((x) => x.toJson())),
        "__v": v,
    };
}

class GroupMember {
    String? name;
    String? number;

    GroupMember({
        this.name,
        this.number,
    });

    factory GroupMember.fromJson(Map<String, dynamic> json) => GroupMember(
        name: json["name"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
    };
}
