import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/Models/create_group_model.dart';
import 'package:splitbuddie/Models/groups_list_model.dart';
import 'package:splitbuddie/Models/user.dart';
import 'package:splitbuddie/common/widgets/bottom_bar.dart';
import 'package:splitbuddie/constants/global_contants.dart';
import 'package:splitbuddie/constants/http_error_handelling.dart';
import 'package:splitbuddie/constants/logger.dart';
import 'package:splitbuddie/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:splitbuddie/features/groups/screens/group_screen.dart';
import 'package:splitbuddie/providers/group_provider.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class CreateGroupServices {
  void createGroup({
    required BuildContext context,
    required String userId,
    required String groupName,
    required String groupType,
  }) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    // print(userProvider.user.token);
    print(userId);
    print(groupName);

    print(groupType);

    try {
      CreateGroup createGroup = CreateGroup(userId: userId, groupName: groupName, groupType: groupType);
      http.Response res = await http.post(
        Uri.parse("$uri/api/user/create-group"),
        body: createGroup.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // Navigator.popUntil(context);
            Navigator.pushNamedAndRemoveUntil(context, BottomBar.routeName, (route) => false);
          });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<GroupsListModel?> getCreatedGroupDetails({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      print("debugging");
      http.Response res = await http.get(
        Uri.parse("$uri/api/user/get-groups-details/$userId"),
        // body: createGroup.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      logger.i("Get Groups Details API ${res.body}");
      GroupsListModel list = groupsListModelFromJson(res.body);

      print("Sahsdns");
      // print("Sahil1234" + newResponse['groups']);
      return list;
    } catch (e) {
      showSnackBar(context, e.toString());
      return null;
    }
  }

  
}
