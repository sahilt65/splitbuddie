import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/constants/dimensions.dart';
import 'package:splitbuddie/features/create_group/screens/create_group_screen.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
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
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
