import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/constants/dimensions.dart';

class CreateGroupScreen extends StatefulWidget {
  static const String routeName = "/create-group-screen";
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  TextEditingController _newGroupNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          const SizedBox(
            width: 150,
          ),
          GestureDetector(
            onTap: () {
              print("Group Created");
            },
            child: Text(
              "Done",
              style: TextStyle(fontSize: Dimensions.font15, color: Colors.black),
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
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                border: Border.all(width: 0.5, color: Colors.black),
                gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                  Color.fromRGBO(211, 229, 242, 1),
                  Color.fromRGBO(191, 210, 226, 1),
                ]),
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/camera_plus_sign.png",
                  height: 40,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 10),
              height: 60,
              // width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Group name",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 325,
                    height: 20,
                    child: TextFormField(
                      controller: _newGroupNameController,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 123, 172, 211)),
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
