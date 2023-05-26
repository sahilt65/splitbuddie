// To parse this JSON data, do
//
//     final othersGroupModel = othersGroupModelFromJson(jsonString);

import 'dart:convert';

OthersGroupModel othersGroupModelFromJson(String str) => OthersGroupModel.fromJson(json.decode(str));

String othersGroupModelToJson(OthersGroupModel data) => json.encode(data.toJson());

class OthersGroupModel {
    List<Group>? groups;

    OthersGroupModel({
        this.groups,
    });

    factory OthersGroupModel.fromJson(Map<String, dynamic> json) => OthersGroupModel(
        groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x.toJson())),
    };
}

class Group {
    String? id;
    String? adminUserId;
    String? groupId;
    String? groupName;
    String? groupType;
    List<GroupMember>? groupMembers;
    int? v;

    Group({
        this.id,
        this.adminUserId,
        this.groupId,
        this.groupName,
        this.groupType,
        this.groupMembers,
        this.v,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
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
