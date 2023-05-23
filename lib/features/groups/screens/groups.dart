import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splitbuddie/common/widgets/bottom_bar.dart';
import 'package:splitbuddie/features/groups/widgets/Horizontalcard.dart';

import '../widgets/Verticalcard.dart';

class Groups extends StatefulWidget {
  const Groups({super.key});

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF454B5E),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Search',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GroupcardVertical(name: 'Group A'),
                      GroupcardVertical(name: 'Group B'),
                      GroupcardVertical(name: 'Group C'),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GroupcardHorizontal(
                        name: 'Group A',
                        members: '5',
                        colour: Colors.white,
                      ),
                      GroupcardHorizontal(
                        name: 'Group B',
                        members: '4',
                        colour: Colors.white,
                      ),
                      GroupcardHorizontal(
                        name: 'Group C',
                        members: '6',
                        colour: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              // flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {},
                    label: Text('Start New Group'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
