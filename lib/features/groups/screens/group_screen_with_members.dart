// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:splitbuddie/Models/main_group_model.dart';
import 'package:splitbuddie/constants/colors.dart';

class GroupInfoScreenWithMembers extends StatefulWidget {
  final Map<String, dynamic> groupInfo;
  const GroupInfoScreenWithMembers({
    Key? key,
    required this.groupInfo,
  }) : super(key: key);

  @override
  State<GroupInfoScreenWithMembers> createState() => _GroupInfoScreenWithMembersState();
}

class _GroupInfoScreenWithMembersState extends State<GroupInfoScreenWithMembers> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> groupMembersList = widget.groupInfo["groupMembers"];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: AppColors.screenBackgroundColor,
        title: Text(
          "Group Name",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: groupMembersList.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(groupMembersList[index]["name"]),
            );
          }),
    );
  }
}
