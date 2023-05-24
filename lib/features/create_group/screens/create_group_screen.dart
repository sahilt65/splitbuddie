import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/constants/dimensions.dart';
import 'package:splitbuddie/features/create_group/services/create_group_services.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class CreateGroupScreen extends StatefulWidget {
  static const String routeName = "/create-group-screen";
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController newGroupNameController = TextEditingController();
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    CreateGroupServices createGroupServices = CreateGroupServices();

    void onPressedCreateGroup() {
      String? userId = userProvider.user.id;
      createGroupServices.createGroup(
          userId: userId!,
          context: context,
          groupName: newGroupNameController.text,
          groupType: "Flat Mates");
    }

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        elevation: 3,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: AppColors.screenBackgroundColor,
        title: Row(children: [
          Text(
            "Create Group",
            style: TextStyle(fontSize: Dimensions.font22, color: Colors.black),
          ),
          SizedBox(
            width: 150.w,
          ),
          GestureDetector(
            onTap: onPressedCreateGroup,
            child: Text(
              "Done",
              style:
                  TextStyle(fontSize: Dimensions.font15, color: Colors.black),
            ),
          ),
        ]),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                border: Border.all(width: 0.5, color: Colors.black),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(211, 229, 242, 1),
                      Color.fromRGBO(191, 210, 226, 1),
                    ]),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/camera_plus_sign.png",
                  height: 40.h,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w, right: 10.w),
              height: 60,
              // width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Group name",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 325.w,
                    height: 20.h,
                    child: TextFormField(
                      controller: newGroupNameController,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 123, 172, 211)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
