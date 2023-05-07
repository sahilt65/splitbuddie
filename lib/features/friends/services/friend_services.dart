import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/Models/friend_list_model.dart';
import 'package:splitbuddie/Models/friend_model.dart';
import 'package:http/http.dart' as http;
import 'package:splitbuddie/constants/global_contants.dart';
import 'package:splitbuddie/constants/utils.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class FriendServices {
  Future<List<dynamic>> getUserFriendList({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String? userId = userProvider.user.id;
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/user/get-user-friend-list/$userId"),
        // body: createGroup.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print("SAhil");
      print(jsonDecode(res.body)[0].runtimeType);
      print(jsonDecode(res.body)[0]["_id"]);
      print(jsonDecode(res.body)[0]["friendList"].runtimeType);

      List<dynamic> friednssssList = jsonDecode(res.body)[0]["friendList"];
      print("Have : " + friednssssList[0]['name']);

      return friednssssList;

      // String temp = jsonDecode(res.body)[0].toString();
      // FriendList friendList = FriendList.fromJson(temp);

      // print(friendList.userId);
      // print(friendList.friendList.toString());
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
      return jsonDecode('{"error" : "Some error occured"}');
    }
  }
}
