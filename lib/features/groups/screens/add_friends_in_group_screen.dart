import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddFriendInGroupScreen extends StatefulWidget {
  static const String routeName = "/add-friend-in-group-screen";
  const AddFriendInGroupScreen({super.key});

  @override
  State<AddFriendInGroupScreen> createState() => _AddFriendInGroupScreenState();
}

class _AddFriendInGroupScreenState extends State<AddFriendInGroupScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllContacts();
  }

  void getAllContacts() async {
    List<Contact> _contact = (await ContactsService.getContacts(withThumbnails: false)).toList();
    setState(() {
      contacts = _contact;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              "${contacts[index].displayName!}",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text(
              contacts[index].phones!.elementAt(0).value!,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
