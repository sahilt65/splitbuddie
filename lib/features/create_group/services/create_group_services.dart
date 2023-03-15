import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/Models/create_group_model.dart';
import 'package:splitbuddie/Models/user.dart';
import 'package:splitbuddie/constants/global_contants.dart';
import 'package:splitbuddie/constants/utils.dart';
import 'package:http/http.dart' as http;
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
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
