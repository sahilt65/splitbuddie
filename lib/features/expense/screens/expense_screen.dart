import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/expense/screens/add_expense_screem.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});
  static const String routeName = "/expense";

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      CircleAvatar(
                        radius: 25.r,
                        child: Image(image: AssetImage("assets/images/test_person.png")),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Group Name",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          Text(
                            "Member",
                            style: TextStyle(fontWeight: FontWeight.w200),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60.w),
                    child: Text("You have to pay ₹200 to others"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Container(
                              child: Row(children: [
                                Text("You have to pay ₹50 top Friend $index name"),
                              ]),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.w, bottom: 60.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AddExpenseScreen.routeName, arguments: "645e0b0ba5dcfd1958d2fcc0");
                  },
                  child: Container(
                    height: 50.h,
                    width: 150.w,
                    decoration:
                        BoxDecoration(color: Color(0xff74D4F6), borderRadius: BorderRadius.all(Radius.circular(25.r))),
                    child: const Center(
                        child: Text(
                      'Add Expense',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
