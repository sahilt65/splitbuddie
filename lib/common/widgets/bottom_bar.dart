// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/Home/screens/home_page.dart';
import 'package:splitbuddie/features/friends/screens/friends_screen.dart';
import 'package:splitbuddie/features/groups/screens/group_info_screen.dart';
import 'package:splitbuddie/features/groups/screens/group_screen.dart';
import 'package:splitbuddie/features/groups/screens/groups.dart';

class BottomBar extends StatefulWidget {
  final int? indexFromOtherPage;
  static const String routeName = '/actual-home';
  const BottomBar({
    Key? key,
    this.indexFromOtherPage,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavigationBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = const [
    HomePage(),
    GroupScreen(),
    FriendsScreen(),
    Groups(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.screenBackgroundColor,
      body: pages[_page],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          // color: AppColors.screenBackgroundColor,
          color: Colors.black,
          border: Border.all(width: 1, color: Color.fromRGBO(200, 216, 226, 1)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(190, 208, 219, 0.7),
              offset: const Offset(0, 3),
              blurRadius: 10.0,
              spreadRadius: 4.0,
            )
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: AppColors.screenBackgroundColor,
          unselectedItemColor: Colors.grey,
          iconSize: 28,
          // fixedColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
              backgroundColor: AppColors.screenBackgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined),
              label: "Groups",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Friends",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_sharp),
              label: "History",
            ),
          ],
          currentIndex: _page,
          selectedItemColor: Color.fromRGBO(69, 75, 94, 1),

          onTap: (int value) {
            print(value);
            _page = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}
