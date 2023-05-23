import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/groups/widgets/Horizontalcard.dart';

class Profilebox extends StatefulWidget {
  const Profilebox({super.key});

  @override
  State<Profilebox> createState() => _ProfileboxState();
}

class _ProfileboxState extends State<Profilebox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.topRight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // backgroundColor: Colors.white,
      title: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        height: 275.h,
        width: 325.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Name',
                      style: TextStyle(
                        fontSize: 30.0.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      ' sample@gmail.com ',
                      style: TextStyle(
                        fontSize: 18.0.sp,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                  // height: 10.h,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(153, 185, 223, 1),
                  radius: 35.r,
                  backgroundImage: const AssetImage(
                    "assets/images/test_person.png",
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 7.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.card_giftcard,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invite Friends, Get Rewards',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Share Your Referal Code ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 35.h,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Rate',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 30.h,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Contact',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 19.sp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
