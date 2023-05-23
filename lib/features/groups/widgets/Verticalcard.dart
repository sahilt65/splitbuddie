import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupcardVertical extends StatelessWidget {
  GroupcardVertical({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromRGBO(153, 185, 223, 1),
            radius: 35.r,
            backgroundImage: AssetImage(
              "assets/images/test_person.png",
            ),
          ),
          SizedBox(
            width: 10.w,
            height: 10.h,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
