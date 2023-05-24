import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:splitbuddie/Models/friend_list_model.dart';
import 'package:splitbuddie/Models/friend_model.dart';
import 'package:http/http.dart' as http;
import 'package:splitbuddie/Models/main_group_model.dart';
import 'package:splitbuddie/constants/global_contants.dart';
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
      Group groupDetails = Group(
        adminUserId: adminUserId,
        groupId: groupId,
        groupName: groupName,
        groupType: groupType,
        groupMembers: groupMembers,
      );
      http.Response res = await http.post(
        Uri.parse("$uri/api/group/post-group-details"),
        body: groupDetails.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<Map<String, dynamic>?> getGroupDetails({
    required String groupId,
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/group/get-group-info/$groupId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
      );
      print("sahbdfshjbfd");
      // print(res.body.runtimeType);
      // print(jsonDecode(res.body)[0]);
      List<Groups> groups = groupsFromJson(res.body);
      if (res.body == "[]") {
        return null;
      } else {
        print(res.body);
        Map<String, dynamic> groupDetails = jsonDecode(res.body)[0] ?? {};
        return groupDetails;
      }

      // Group group = Group.fromJson(jsonDecode(res.body)[0]);
      // print(group.adminUserId);
      // print("SAjiodnsdn : " + res.body.runtimeType.toString());
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
      return {};
    }
  }
}
