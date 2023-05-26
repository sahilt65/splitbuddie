// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:splitbuddie/Models/contact_model.dart';
import 'package:splitbuddie/Models/create_group_model.dart';
import 'package:splitbuddie/Models/friend_model.dart';
import 'package:splitbuddie/Models/get_user_model.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/Home/home_services.dart';
import 'package:splitbuddie/features/groups/services/add_friends_to_user_friend_list.dart';
import 'package:splitbuddie/features/groups/services/group_details_services.dart';
import 'package:splitbuddie/providers/group_provider.dart';
import 'package:splitbuddie/providers/user_provider.dart';

class AddFriendInGroupScreen extends StatefulWidget {
  static const String routeName = "/add-friend-in-group-screen";
  final CreateGroup groupInfo;
  const AddFriendInGroupScreen({
    Key? key,
    required this.groupInfo,
  }) : super(key: key);

  @override
  State<AddFriendInGroupScreen> createState() => _AddFriendInGroupScreenState();
}

class _AddFriendInGroupScreenState extends State<AddFriendInGroupScreen> {
  List<ContactsModel> contacts = [];
  bool isSelected = false;
  List<Friend> friendList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("----------------/////////-----------------------");
    print(widget.groupInfo.groupId);
    getuserDetails();
    getAllContacts();
    // addToFriendList();
    getUserId();

  }

  void getAllContacts() async {
    List<Contact> _contact = (await ContactsService.getContacts(withThumbnails: false)).toList();
    List<ContactsModel> tempContact = [];

    setState(() {
      // contacts = _contact;
      for (var element in _contact) {
        tempContact.add(
          ContactsModel(
            name: element.displayName!,
            number: element.phones!.elementAt(0).value!,
            isSelected: isSelected,
          ),
        );
      }
      contacts = tempContact;
    });
  }

  String? userId = "";
  void getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('id');
  }

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

  void addToFriendList() {
    List<Friend> tempFriendList = [];
    setState(() {
      Friend friend = Friend(name: user!.name!, number: user!.mob!);
      tempFriendList.add(friend);
      for (int i = 0; i < contacts.length; i++) {
        if (contacts[i].isSelected) {
          tempFriendList.add(Friend(name: contacts[i].name, number: contacts[i].number));
        }
      }

      friendList = tempFriendList;
    });
  }

  AddFriendsToUserListServices addFriendsToUserListServices = AddFriendsToUserListServices();
  PostGroupDetailsServices postGroupDetailsServices = PostGroupDetailsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              postGroupDetailsServices.postGroupDetails(
                adminUserId: userId!,
                groupId: widget.groupInfo.groupId!,
                groupName: widget.groupInfo.groupName,
                groupType: widget.groupInfo.groupType,
                groupMembers: friendList,
                context: context,
              );
              addFriendsToUserListServices.addFriendsToUserList(
                friendsList: friendList,
                userId: userId,
                context: context,
              );
            },
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  "done",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
        ],
        title: const Text("Add Friends to Group", style: TextStyle(color: Colors.black)),
        backgroundColor: AppColors.screenBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: AppColors.screenBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text("Choose from your friends"),
              ListView.builder(
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    splashColor: const Color.fromRGBO(153, 185, 223, 1),
                    // borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      print("sahil");
                    },
                    child: ListTile(
                      // leading: CircleAvatar(child: contacts[index].avatar),
                      title: Text(
                        contacts[index].name,
                        // newContactList[index].name,
                        style: const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      subtitle: Text(
                        contacts[index].number,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      trailing: contacts[index].isSelected
                          ? const Icon(
                              Icons.check,
                              color: Color.fromARGB(255, 135, 188, 212),
                            )
                          : Container(
                              height: 0,
                              width: 0,
                            ),

                      onTap: () {
                        setState(() {
                          contacts[index].isSelected = !contacts[index].isSelected;
                          addToFriendList();
                        });
                      },
                    ),
                  );
                },
              ),
              Text("Choose from your contacts"),
              ListView.builder(
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      contacts[index].name,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    subtitle: Text(
                      contacts[index].number,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
