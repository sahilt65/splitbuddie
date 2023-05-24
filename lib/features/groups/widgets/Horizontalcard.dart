import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupcardHorizontal extends StatelessWidget {
  GroupcardHorizontal(
      {required this.name, required this.members, required this.colour});
  final String name;
  final String members;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromRGBO(153, 185, 223, 1),
            radius: 35.r,
            backgroundImage: const AssetImage(
              "assets/images/test_person.png",
            ),
          ),
          SizedBox(
            width: 20.w,
            // height: 10.h,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.0.sp,
                  color: colour,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                '$members members',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
