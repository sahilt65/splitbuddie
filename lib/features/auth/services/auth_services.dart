// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splitbuddie/Models/user.dart';
import 'package:http/http.dart' as http;
import 'package:splitbuddie/common/widgets/bottom_bar.dart';
import 'package:splitbuddie/constants/http_error_handelling.dart';
import 'package:splitbuddie/constants/utils.dart';
import 'package:splitbuddie/constants/global_contants.dart';
import 'package:splitbuddie/features/Home/screens/home_page.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class AuthService {
  //sign up
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String mob,
  }) async {
    try {
      User user = User(
        id: "",
        name: name,
        email: email,
        mob: mob,
        password: password,
        token: "",
        groupDetails: [],
      );
      print("1");
      http.Response res = await http.post(
        Uri.parse("$uri/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("2");

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, "Account Created! Login with the same credentials");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //Sign in
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/signin"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print("Sahil123 :" + res.body);

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          print("Success1");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          print("Success2");
          Provider.of<UserProvider>(context, listen: false)
              .setUser(res.body.toString());
          print("Success3");
          prefs.setString("x-auth-token", jsonDecode(res.body)['token']);
          print("Success4");
          Navigator.pushNamedAndRemoveUntil(
            context,
            BottomBar.routeName,
            (route) => false,
          );
          // Navigator.push(contex)
          // Navigator.pushNamed(context, HomePage.routeName);
          print("Success");
        },
      );
    } catch (e) {
      print("Sahil");
      showSnackBar(context, e.toString());
    }
  }

  //Check token is valid or not

  //Sign in
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');

      if (token == null) {
        pref.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse("$uri/tokenIsValid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userResponse = await http.get(
          Uri.parse("$uri/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
