import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/constants/dimensions.dart';
import 'package:splitbuddie/features/create_group/screens/create_group_screen.dart';
import 'package:splitbuddie/features/create_group/services/create_group_services.dart';
import 'package:splitbuddie/features/groups/screens/group_info_screen.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  
  void navigateToGroupInfoScreen() {
    CreateGroupServices createGroupServices = CreateGroupServices();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String? userId = userProvider.user.id;
    createGroupServices.getGroupsDetails(context: context, userId: userId!);
    Navigator.pushNamed(context, GroupInfoScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    print("sahil");
    print(userProvider.user.token);
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "Groups",
            style: TextStyle(fontSize: Dimensions.font22, color: Colors.black),
          ),
          const SizedBox(
            width: 150,
          ),
          const Icon(
            Icons.search,
            color: Colors.black,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, CreateGroupScreen.routeName);
            },
            child: const Icon(
              Icons.group_add_outlined,
              color: Colors.black,
            ),
          )
        ]),
        backgroundColor: AppColors.screenBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: navigateToGroupInfoScreen,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            color: AppColors.screenBackgroundColor,
                            child: Image.asset(
                              "assets/images/group-icon.png",
                              height: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 20, left: 15),
                                child: const Text(
                                  "Group Name",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20, left: 15),
                                child: const Text(
                                  "You Borrowed 1000",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
