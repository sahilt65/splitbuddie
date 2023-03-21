import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:splitbuddie/Models/friend_list_model.dart';
import 'package:splitbuddie/Models/friend_model.dart';
import 'package:http/http.dart' as http;
import 'package:splitbuddie/constants/global_contants.dart';
import 'package:splitbuddie/constants/utils.dart';

class AddFriendsToUserListServices {
  void addFriendsToUserList({
    required List<Friend> friendsList,
    required userId,
    required BuildContext context,
  }) async {
    try {
      FriendList postFriends = FriendList(userId: userId, friendList: friendsList);
      http.Response res = await http.post(
        Uri.parse("$uri/api/user/add-friends-to-user"),
        body: postFriends.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
