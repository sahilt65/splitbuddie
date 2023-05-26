// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'package:splitbuddie/Models/create_group_model.dart';
import 'package:splitbuddie/common/widgets/bottom_bar.dart';
import 'package:splitbuddie/common/widgets/custom_button.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/create_group/services/create_group_services.dart';
import 'package:splitbuddie/features/expense/screens/expense_screen.dart';
import 'package:splitbuddie/features/groups/models/group_model.dart';
import 'package:splitbuddie/features/groups/screens/add_friends_in_group_screen.dart';
import 'package:splitbuddie/features/groups/screens/group_screen_with_members.dart';
import 'package:splitbuddie/features/groups/screens/no_group_member_screen.dart';
import 'package:splitbuddie/features/groups/services/group_details_services.dart';
import 'package:splitbuddie/features/groups/widgets/scroll_button_widget.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class GroupInfoScreen extends StatefulWidget {
  static const String routeName = '/group-info-screen';
  final CreateGroup groupInfo;
  const GroupInfoScreen({
    Key? key,
    required this.groupInfo,
  }) : super(key: key);

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  PostGroupDetailsServices postGroupDetailsServices = PostGroupDetailsServices();
  List<Groups>? groupDetails;
  bool isLoaded = false;
  void getGroupInfo() async {
    groupDetails = await postGroupDetailsServices.getGroupDetails(context: context, groupId: widget.groupInfo.groupId!);
    if (groupDetails != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {

    super.initState();
    getGroupInfo();
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? groupDetails!.isEmpty
            ? NoGroupMemberScreen(groupInfo: widget.groupInfo)
            : ExpenseScreen(groupId: widget.groupInfo.groupId!)
        : const Scaffold(
            backgroundColor: AppColors.screenBackgroundColor,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
  }
}
