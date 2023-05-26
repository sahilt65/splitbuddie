// To parse this JSON data, do
//
//     final groupsListModel = groupsListModelFromJson(jsonString);

import 'dart:convert';

GroupsListModel groupsListModelFromJson(String str) => GroupsListModel.fromJson(json.decode(str));

String groupsListModelToJson(GroupsListModel data) => json.encode(data.toJson());

class GroupsListModel {
    List<Group>? groups;

    GroupsListModel({
        this.groups,
    });

    factory GroupsListModel.fromJson(Map<String, dynamic> json) => GroupsListModel(
        groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x.toJson())),
    };
}

class Group {
    String? id;
    String? userId;
    String? groupName;
    String? groupType;
    int? v;

    Group({
        this.id,
        this.userId,
        this.groupName,
        this.groupType,
        this.v,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["_id"],
        userId: json["userId"],
        groupName: json["groupName"],
        groupType: json["groupType"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "groupName": groupName,
        "groupType": groupType,
        "__v": v,
    };
}
