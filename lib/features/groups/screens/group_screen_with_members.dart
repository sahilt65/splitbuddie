// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:splitbuddie/Models/main_group_model.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/groups/models/group_model.dart';

class GroupInfoScreenWithMembers extends StatefulWidget {
  final Groups groupInfo;
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
          itemCount: widget.groupInfo.groupMembers!.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(widget.groupInfo.groupMembers![index].name.toString()),
            );
          }),
    );
  }
}
