import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:splitbuddie/Models/friend_list_model.dart';
import 'package:splitbuddie/Models/friend_model.dart';
import 'package:http/http.dart' as http;
import 'package:splitbuddie/Models/main_group_model.dart';
import 'package:splitbuddie/Models/others_group_model.dart' as others;
import 'package:splitbuddie/constants/global_contants.dart';
import 'package:splitbuddie/constants/logger.dart';
import 'package:splitbuddie/constants/utils.dart';
import 'package:splitbuddie/features/groups/models/group_model.dart';

class PostGroupDetailsServices {
  void postGroupDetails({
    required String adminUserId,
    required String groupId,
    required String groupName,
    required String groupType,
    required List<Friend> groupMembers,
    required BuildContext context,
  }) async {
    try {
      print(adminUserId);
      Group groupDetails = Group(
        adminUserId: adminUserId,
        groupId: groupId,
        groupName: groupName,
        groupType: groupType,
        groupMembers: groupMembers,
      );
      print("-----//////-------//////-------/////");
      print("$uri/api/group/post-group-details");
      http.Response res = await http.post(
        Uri.parse("$uri/api/group/post-group-details"),
        body: groupDetails.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
      );

      Navigator.pop(context);

      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Groups>?> getGroupDetails({
    required String groupId,
    required BuildContext context,
  }) async {
    print("---------------------------------");
    print("$uri/api/group/get-group-info/$groupId");

    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/group/get-group-info/$groupId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      logger.i("Get Expense Api : ${res.body}");
      print("sahbdfshjbfd");
      List<Groups> groups = groupsFromJson(res.body);
      print(res.body);
      return groups;

      // Group group = Group.fromJson(jsonDecode(res.body)[0]);
      // print(group.adminUserId);
      // print("SAjiodnsdn : " + res.body.runtimeType.toString());
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
      return null;
    }
  }
  Future<others.OthersGroupModel?> getCreatedGroupDetails({
    required BuildContext context,
    required String mobileno,
  }) async {
    try {
      print("debugging");
      http.Response res = await http.get(
        Uri.parse("$uri/api/user/get-groups-details-by-others/$mobileno"),
        // body: createGroup.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      logger.i("Get Groups Details API ${res.body}");
      others.OthersGroupModel list = others.othersGroupModelFromJson(res.body);
      return list;
    } catch (e) {
      showSnackBar(context, e.toString());
      return null;
    }
  }
}
