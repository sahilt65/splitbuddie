import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splitbuddie/constants/global_contants.dart';
import 'package:splitbuddie/constants/logger.dart';
import 'package:splitbuddie/constants/utils.dart';
import 'package:splitbuddie/features/expense/models/expense_models.dart';
import 'package:splitbuddie/features/groups/models/group_model.dart';
import 'package:logger/logger.dart';

class ExpenseServices {
  Future addExpense({
    required String description,
    required double spend,
    required String groupId,
    required List<FriendsList> friendList,
    required BuildContext context,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var obtainId = pref.getString("id");
  
      print(description);
      Expense expense = Expense(
        description: description,
        totalExpense: spend,
        friendsList: friendList,
        groupId: groupId,
        payer: obtainId,
      );

      http.Response res = await http.post(
        Uri.parse("$uri/api/user/add-expense"),
        body: expenseToJson(expense),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
      );
      logger.i("Add Expense Api : $res");

      if (res.statusCode == 200) {
        print("Success");
        Navigator.pop(context);
      }
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

  Future<Expense?> getExpenseDetails({required String groupId, required BuildContext context}) async {
    try {
      http.Response res = await http.get(Uri.parse("$uri/api/user/get-expense/$groupId"));
      if (res.statusCode == 200) {
        Expense expense = expenseFromJson(res.body);
        print("-------------");
        print(res.body);
        return expense;
      }
    } catch (e) {
      print("sasjn----");
      print(e.toString());
      return null;
    }
  }
}
