import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/features/create_group/services/create_group_services.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class GroupInfoScreen extends StatefulWidget {
  static const String routeName = '/group-info-screen';
  const GroupInfoScreen({super.key});

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  CreateGroupServices createGroupServices = CreateGroupServices();
  List<String> groupsInfo = [];
  late Map<String, dynamic> groupDetails;

  Future<String> getDetails() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String? userId = userProvider.user.id;
    groupDetails = await createGroupServices.getGroupsDetails(context: context, userId: userId!);

    // groupDetails.forEach((key, value) {
    //   if (key == 'groupName') {}

    //   groupsInfo.add(groupDetails["groups"]);
    // });

    return groupDetails['groups'];
  }

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Center(child: Text("Groups Info"));
      },
    ));
  }
}
