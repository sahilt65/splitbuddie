// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:splitbuddie/Models/create_group_model.dart';
import 'package:splitbuddie/Models/main_group_model.dart';

import 'package:splitbuddie/features/groups/screens/add_friends_in_group_screen.dart';
import 'package:splitbuddie/features/groups/widgets/scroll_button_widget.dart';

import '../../../constants/colors.dart';

class NoGroupMemberScreen extends StatefulWidget {
  final CreateGroup groupInfo;

  const NoGroupMemberScreen({
    Key? key,
    required this.groupInfo,
  }) : super(key: key);

  @override
  State<NoGroupMemberScreen> createState() => _NoGroupMemberScreenState();
}

class _NoGroupMemberScreenState extends State<NoGroupMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppColors.screenBackgroundColor,
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.groupInfo.groupName,
          style: const TextStyle(color: Colors.black),
        ),
        actions: const [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.login),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.delete_outline),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
          // color: AppColors.screenBackgroundColor,
          child: Container(
        padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "No expense here yet",
              style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ScrollButtonWidget(height: 32, width: 110, text: "Settle Up", onTap: () {}),
                  const SizedBox(width: 10),
                  ScrollButtonWidget(height: 32, width: 110, text: "Balances", onTap: () {}),
                  const SizedBox(width: 10),
                  ScrollButtonWidget(height: 32, width: 110, text: "Total", onTap: () {}),
                  const SizedBox(width: 10),
                  ScrollButtonWidget(height: 32, width: 110, text: "Charts", onTap: () {}),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "You are the only one in this group",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              splashColor: Color.fromRGBO(153, 185, 223, 1),
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.popAndPushNamed(context, AddFriendInGroupScreen.routeName, arguments: widget.groupInfo);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Color.fromRGBO(153, 185, 223, 1),
                      child: Center(
                        child: Icon(
                          Icons.group_add_outlined,
                          size: 35,
                          color: Colors.black,
                          weight: 0.1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Add friends to the group",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              splashColor: const Color.fromRGBO(153, 185, 223, 1),
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Color.fromRGBO(153, 185, 223, 1),
                      child: Center(
                        child: Icon(
                          Icons.link_outlined,
                          weight: 0.1,
                          size: 35,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Share the group link",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
