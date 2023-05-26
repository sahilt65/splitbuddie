
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splitbuddie/Models/get_user_model.dart';
import 'package:splitbuddie/Models/user.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/Home/home_services.dart';
import 'package:splitbuddie/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/groups/widgets/Horizontalcard.dart';

class Profilebox extends StatefulWidget {
  const Profilebox({super.key});

  @override
  State<Profilebox> createState() => _ProfileboxState();
}

class _ProfileboxState extends State<Profilebox> {
  HomeServices homeServices = HomeServices();
  UserModel? user;
  bool isUserLoaded = false;
  Future getuserDetails() async {
    user = await homeServices.getUserDetails();
    if (user != null) {
      setState(() {
        isUserLoaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topRight,
      backgroundColor: AppColors.screenBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // backgroundColor: Colors.white,
      title: Container(
        decoration: BoxDecoration(
          color: AppColors.screenBackgroundColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        height: 275.h,
        width: 325.w,
        child: isUserLoaded
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user!.name!,
                            style: TextStyle(
                              fontSize: 30.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            user!.email!,
                            style: TextStyle(
                              fontSize: 18.0.sp,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                        // height: 10.h,
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(153, 185, 223, 1),
                        radius: 35.r,
                        backgroundImage: const AssetImage(
                          "assets/images/test_person.png",
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.card_giftcard,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invite Friends, Get Rewards',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            'Share Your Referal Code ',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star_border,
                            size: 35.h,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Rate',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.phone,
                            size: 30.h,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Contact',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        const Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        GestureDetector(
                          onTap: () async {
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            var obtainEmail = pref.getString("id");
                            pref.remove("id");
                            Navigator.pushNamedAndRemoveUntil(context, AuthScreen.routeName, (route) => false);
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 19.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(color: AppColors.mainAppColor),
              ),
        
      ),
    );
  }
}
