import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/friends/services/friend_services.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  FriendServices friendServices = FriendServices();
  List<dynamic> friendsList = [];
  void getUserFriendList() async {
    List<dynamic> tempList = await friendServices.getUserFriendList(context: context);
    print("Sahil" + tempList[0]['name']);
    friendsList = tempList;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserFriendList();
    // print(friendsList[0]["name"]);
  }

  @override
  Widget build(BuildContext context) {
    print(friendsList.length);
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.screenBackgroundColor,
        title: Row(
          children: const [
            SizedBox(
              width: 10,
            ),
            const Text(
              "Friends",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 228,
            ),
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.person_add_outlined,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: Row(
        //       children: const [
        //         const Text(
        //           "Friends",
        //           style: TextStyle(color: Colors.black),
        //         ),
        //         Icon(
        //           Icons.search,
        //           color: Colors.black,
        //         ),
        //         SizedBox(
        //           width: 20,
        //         ),
        //         Icon(
        //           Icons.person_add_outlined,
        //           color: Colors.black,
        //         ),
        //         SizedBox(
        //           width: 20,
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: friendsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Text(friendsList[index]['name'][0]),
                        backgroundColor: Colors.blue[200],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            friendsList[index]['name'],
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            friendsList[index]['number'],
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
