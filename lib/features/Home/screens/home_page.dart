import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:splitbuddie/common/widgets/custom_button.dart';
import 'package:splitbuddie/common/widgets/custom_text_field.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splitbuddie/features/Home/widgets/home_card_widget.dart';
import 'package:splitbuddie/features/auth/screens/auth_screen.dart';
import 'package:splitbuddie/features/auth/screens/signin_screen.dart';
import 'package:splitbuddie/features/auth/screens/signup_screen.dart';
import 'package:splitbuddie/features/create_group/screens/create_group_screen.dart';
import 'package:splitbuddie/profile/screens/profilebox.dart';

import '../../groups/widgets/Horizontalcard.dart';
import 'package:splitbuddie/features/expense/screens/expense_screen.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(gradi),
        child: Scaffold(
          backgroundColor: AppColors.screenBackgroundColor,
          // Color.fromRGBO(223, 235, 245, 1),
          body: Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //first Row
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            print('Ala ka ree');
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return Profilebox();
                                });
                          },
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(153, 185, 223, 1),
                            radius: 35.r,
                            backgroundImage: AssetImage(
                              "assets/images/test_person.png",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //second Row
                Padding(
                  padding: const EdgeInsets.only(top: 42, left: 28, right: 28),
                  child: Container(
                    height: 350.h,

                    width: double.infinity,
                    // color: Colors.black,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.yellow,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(87, 92, 116, 1),
                          Color.fromRGBO(88, 93, 117, 1),
                          Color.fromRGBO(94, 99, 124, 1),
                          Color.fromRGBO(98, 104, 129, 1),
                          Color.fromRGBO(99, 104, 130, 1),
                          Color.fromRGBO(106, 112, 139, 1),
                          Color.fromRGBO(107, 112, 139, 1),
                        ],
                      ),
                    ),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 60.h, left: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Account Balance",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "₹ 12000",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Image.asset(
                          "assets/images/test_person.png",
                          height: 150.h,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeCardWidget(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CreateGroupScreen.routeName);
                      },
                      mainCardColorGradient: const [
                        Color.fromRGBO(211, 233, 249, 1),
                        Color.fromRGBO(147, 183, 215, 1),
                        Color.fromRGBO(110, 166, 206, 1),
                      ],
                      circularIconColorGradient: const [
                        Color.fromRGBO(211, 233, 249, 1),
                        Color.fromRGBO(110, 166, 206, 1),
                      ],
                      circularIconBorderColor:
                          const Color.fromRGBO(104, 148, 181, 1),
                      mainBorderColor: const Color.fromRGBO(93, 136, 164, 1),
                      boxShadowColor: const Color.fromRGBO(173, 209, 231, 1),
                      insideCircularIcon: Icons.add_outlined,
                      mainText: "Group",
                      leftPadding: 28.w,
                    ),
                    HomeCardWidget(
                      onTap: () {},
                      mainCardColorGradient: const [
                        Color.fromRGBO(242, 202, 202, 1),
                        Color.fromRGBO(227, 186, 185, 1),
                        Color.fromRGBO(209, 160, 160, 1),
                        // Color.fromRGBO(179, 129, 129, 1),
                        Color.fromRGBO(209, 121, 121, 1),
                      ],
                      mainBorderColor: const Color.fromRGBO(179, 129, 129, 1),
                      boxShadowColor: const Color.fromRGBO(173, 209, 231, 1),
                      mainText: "Spend",
                      circularIconColorGradient: const [
                        Color.fromRGBO(242, 202, 202, 1),
                        Color.fromRGBO(209, 121, 121, 1),
                      ],
                      circularIconBorderColor:
                          const Color.fromRGBO(104, 148, 181, 1),
                      insideCircularIcon: Icons.add_outlined,
                      rightPadding: 0.w,
                    ),
                    HomeCardWidget(
                      onTap: () {
                        print("Sahil");
                        Navigator.pushNamed(context, ExpenseScreen.routeName);
                      },
                      leftPadding: 0,
                      rightPadding: 20.w,
                      mainCardColorGradient: [
                        Color.fromRGBO(214, 245, 240, 1),
                        Color.fromRGBO(169, 215, 206, 1),
                        Color.fromRGBO(111, 189, 175, 1),
                        Color.fromRGBO(99, 192, 175, 1),
                      ],
                      mainBorderColor: Color.fromRGBO(111, 189, 175, 1),
                      boxShadowColor: Color.fromRGBO(173, 209, 231, 1),
                      mainText: "Borrow",
                      circularIconColorGradient: [
                        Color.fromRGBO(214, 245, 240, 1),
                        Color.fromRGBO(169, 215, 206, 1),
                        Color.fromRGBO(111, 189, 175, 1),
                        Color.fromRGBO(99, 192, 175, 1),
                      ],
                      circularIconBorderColor: Color.fromRGBO(104, 148, 181, 1),
                      insideCircularIcon: Icons.add_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
