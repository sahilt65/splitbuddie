// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:splitbuddie/Models/create_group_model.dart';
import 'package:splitbuddie/Models/groups_list_model.dart';
import 'package:splitbuddie/Models/others_group_model.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/constants/dimensions.dart';
import 'package:splitbuddie/features/create_group/screens/create_group_screen.dart';
import 'package:splitbuddie/features/create_group/services/create_group_services.dart';
import 'package:splitbuddie/features/groups/screens/group_info_screen.dart';
import 'package:splitbuddie/features/groups/services/group_details_services.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class OthersGroupScreen extends StatefulWidget {
  static const routeName = "/others-group-screen";
  String mobileno;
  OthersGroupScreen({
    Key? key,
    required this.mobileno,
  }) : super(key: key);

  @override
  State<OthersGroupScreen> createState() => _OthersGroupScreenState();
}

class _OthersGroupScreenState extends State<OthersGroupScreen> {
  void navigateToGroupInfoScreen() {}

  PostGroupDetailsServices groupsServices = PostGroupDetailsServices();
  OthersGroupModel? groupDetails;
  bool isLoaded = false;

  void getDetails() async {
    print("Sahil");
    SharedPreferences pref = await SharedPreferences.getInstance();
    var obtainId = pref.getString("id");
    groupDetails = await groupsServices.getCreatedGroupDetails(context: context, mobileno: widget.mobileno);

    if (groupDetails != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
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
      body: !isLoaded
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  color: AppColors.screenBackgroundColor,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: groupDetails!.groups!.length,
                      itemBuilder: (context, index) {
                        CreateGroup createGroup = CreateGroup(
                          groupId: groupDetails!.groups![index].groupId,
                          userId: "",
                          groupName: groupDetails!.groups![index].groupName!,
                          groupType: groupDetails!.groups![index].groupType!,
                        );
                        return GestureDetector(
                          onTap: () {
                            final userProvider = Provider.of<UserProvider>(context, listen: false);
                            String? userId = userProvider.user.id;
                            Navigator.pushNamed(context, GroupInfoScreen.routeName, arguments: createGroup);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color.fromRGBO(153, 185, 223, 1),
                                  radius: 35.r,
                                  backgroundImage: const AssetImage(
                                    "assets/images/test_person.png",
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 278,
                                      padding: EdgeInsets.only(top: 20, left: 15),
                                      child: Text(
                                        groupDetails!.groups![index].groupName!,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                      ),
                                    ),

                                    // Container(
                                    //   width: 278,
                                    //   padding: EdgeInsets.only(top: 20, left: 15),
                                    //   child: const Text(
                                    //     "No expense",
                                    //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                                    //   ),
                                    // ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
