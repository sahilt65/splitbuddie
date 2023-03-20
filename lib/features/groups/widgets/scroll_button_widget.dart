// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScrollButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Function() onTap;

  const ScrollButtonWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color.fromRGBO(153, 185, 223, 1),
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        )),
      ),
    );
  }
}
