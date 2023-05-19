import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:splitbuddie/common/widgets/custom_button.dart';
import 'package:splitbuddie/common/widgets/custom_text_field.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/Home/widgets/home_card_widget.dart';
import 'package:splitbuddie/features/auth/screens/auth_screen.dart';
import 'package:splitbuddie/features/auth/screens/signin_screen.dart';
import 'package:splitbuddie/features/auth/screens/signup_screen.dart';
import 'package:splitbuddie/features/create_group/screens/create_group_screen.dart';

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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //first Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "User Name",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Container(
                      child: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(153, 185, 223, 1),
                        radius: 35,
                        backgroundImage: AssetImage(
                          "assets/images/test_person.png",
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
                  height: 190,

                  width: double.infinity,
                  // color: Colors.black,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
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
                        padding: EdgeInsets.only(top: 60, left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Account Balance",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "₹ 12000",
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/images/test_person.png",
                        height: 150,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeCardWidget(
                    onTap: () {
                      Navigator.pushNamed(context, CreateGroupScreen.routeName);
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
                    circularIconBorderColor: const Color.fromRGBO(104, 148, 181, 1),
                    mainBorderColor: const Color.fromRGBO(93, 136, 164, 1),
                    boxShadowColor: const Color.fromRGBO(173, 209, 231, 1),
                    insideCircularIcon: Icons.add_outlined,
                    mainText: "Group",
                    leftPadding: 28,
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
                    circularIconBorderColor: const Color.fromRGBO(104, 148, 181, 1),
                    insideCircularIcon: Icons.add_outlined,
                    rightPadding: 28,
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeCardWidget(
                    onTap: () {},
                    leftPadding: 28,
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
                  HomeCardWidget(
                      onTap: () {},
                      rightPadding: 28,
                      mainCardColorGradient: [
                        Color.fromRGBO(237, 186, 238, 1),
                        Color.fromRGBO(213, 160, 215, 1),
                        Color.fromRGBO(212, 123, 214, 1),
                        Color.fromRGBO(188, 133, 190, 1),
                      ],
                      mainBorderColor: Color.fromRGBO(188, 133, 190, 1),
                      boxShadowColor: Color.fromRGBO(173, 209, 231, 1),
                      mainText: "Borrow",
                      circularIconColorGradient: [
                        Color.fromRGBO(237, 186, 238, 1),
                        Color.fromRGBO(213, 160, 215, 1),
                        Color.fromRGBO(212, 123, 214, 1),
                        Color.fromRGBO(188, 133, 190, 1),
                      ],
                      circularIconBorderColor: Color.fromRGBO(104, 148, 181, 1),
                      insideCircularIcon: Icons.add_outlined),
                ],
              )
            ]),
          ),
          // bottomNavigationBar: Material(
          //   // color: Colors.transparent,
          //   color: Color.fromARGB(255, 178, 223, 244),
          //   elevation: 20,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: AppColors.screenBackgroundColor,
          //       border: Border.all(width: 1, color: Color.fromRGBO(200, 216, 226, 1)),
          //       boxShadow: const [
          //         BoxShadow(
          //           color: Color.fromRGBO(190, 208, 219, 0.7),
          //           offset: const Offset(0, 3),
          //           blurRadius: 10.0,
          //           spreadRadius: 4.0,
          //         )
          //       ],
          //     ),
          //     child: SafeArea(
          //       child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          //           child: BottomNavigationBar(
          //             elevation: 0,
          //             backgroundColor: AppColors.screenBackgroundColor,
          //             items: [
          //               BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          //               BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: "Groups"),
          //               BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
          //             ],
          //           )
          //           // GNav(
          //           //   rippleColor: Colors.grey[300]!,
          //           //   hoverColor: AppColors.screenBackgroundColor,
          //           //   gap: 8,
          //           //   activeColor: Colors.black,
          //           //   iconSize: 24,
          //           //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          //           //   duration: Duration(milliseconds: 400),
          //           //   tabBackgroundColor: AppColors.screenBackgroundColor,
          //           //   color: Colors.black,
          //           //   tabs: const [
          //           //     GButton(
          //           //       icon: LineIcons.home,
          //           //       text: 'Home',
          //           //     ),
          //           //     GButton(
          //           //       icon: Icons.group_outlined,
          //           //       text: 'Likes',
          //           //       iconSize: 24,
          //           //     ),
          //           //     GButton(
          //           //       icon: LineIcons.search,
          //           //       text: 'Search',
          //           //     ),
          //           //     GButton(
          //           //       icon: LineIcons.user,
          //           //       text: 'Profile',
          //           //     ),
          //           //   ],
          //           //   // selectedIndex: _selectedIndex,
          //           //   // onTabChange: (index) {
          //           //   //   setState(() {
          //           //   //     _selectedIndex = index;
          //           //   //   });
          //           //   // },
          //           // ),
          //           ),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
