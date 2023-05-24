// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:splitbuddie/features/create_group/screens/create_group_screen.dart';

class HomeCardWidget extends StatefulWidget {
  final List<Color> mainCardColorGradient;
  final Color mainBorderColor;
  final Color boxShadowColor;
  final String mainText;
  final List<Color> circularIconColorGradient;
  final Color circularIconBorderColor;
  final IconData insideCircularIcon;
  final double? leftPadding;
  final double? rightPadding;
  Function() onTap;
  HomeCardWidget({
    Key? key,
    required this.mainCardColorGradient,
    required this.mainBorderColor,
    required this.boxShadowColor,
    required this.mainText,
    required this.circularIconColorGradient,
    required this.circularIconBorderColor,
    required this.insideCircularIcon,
    this.leftPadding,
    this.rightPadding,
    required this.onTap,
  }) : super(key: key);

  @override
  State<HomeCardWidget> createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.leftPadding != null ? widget.leftPadding! : 0,
          right: widget.rightPadding != null ? widget.rightPadding! : 0),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 140.h,
          width: 120.w,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(width: 1, color: widget.mainBorderColor),
            boxShadow: [
              BoxShadow(
                color: widget.boxShadowColor,
                offset: const Offset(0, 4),
                blurRadius: 10.0.r,
                spreadRadius: 2.0.r,
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.mainCardColorGradient,
            ),
          ),
          child: Padding(
              padding: EdgeInsets.only(top: 30.h, left: 40.w, right: 40.w),
              child: Column(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: widget.circularIconColorGradient,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: widget.circularIconBorderColor),
                    ),
                    child: Center(
                      child: Icon(
                        widget.insideCircularIcon,
                        size: 40.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    widget.mainText,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
