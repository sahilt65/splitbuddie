// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splitbuddie/Models/friend_list_model.dart';

import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/expense/models/expense_models.dart';
import 'package:splitbuddie/features/expense/services/expense_services.dart';
import 'package:splitbuddie/features/groups/models/group_model.dart';
import 'package:splitbuddie/features/groups/services/group_details_services.dart';

class AddExpenseScreen extends StatefulWidget {
  String groupId;
  AddExpenseScreen({
    Key? key,
    required this.groupId,
  }) : super(key: key);
  static const String routeName = "/add-expense";

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController spendController = TextEditingController();
  ExpenseServices expenseServices = ExpenseServices();

  List<Groups>? groups;
  bool groupsLoaded = false;
  Future getGroupDetails() async {
    groups = (await expenseServices.getGroupDetails(groupId: widget.groupId, context: context))!;

    if (groups != null) {
      setState(() {
        groupsLoaded = true;
        print("---------------------------------");
        print(widget.groupId);
      });
    }
  }

  Future addExpense() async {
    List<FriendsList> friendsList = [];
    for (var e in groups![0].groupMembers!) {
      String eachSpend = (double.parse(spendController.text) / groups![0].groupMembers!.length).toStringAsFixed(2);
      FriendsList friend = FriendsList(name: e.name, number: e.number, spend: double.parse(eachSpend));
      friendsList.add(friend);
    }
    print("///////////////////////");
    await expenseServices.addExpense(
        description: descriptionController.text,
        spend: double.parse(spendController.text),
        groupId: widget.groupId,
        friendList: friendsList,
        context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGroupDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Expense",
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(
                  width: 190.w,
                ),
                GestureDetector(
                    onTap: () async {
                      await addExpense();
                    },
                    child: Icon(Icons.check))
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            const Divider(
              color: Colors.black45,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Row(
                    children: [
                      Text(
                        "With",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Text(
                        " you",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      Text(
                        " and : ",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(children: [
                    Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage("assets/images/test_person.png"),
                          )),
                    ),
                    Expanded(
                        child: Text(
                      "All of group name",
                      style: TextStyle(fontSize: 15.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ))
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Divider(
              color: Colors.black45,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.description_outlined,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Container(
                  width: 190.w,
                  height: 30.h,
                  child: Center(
                    child: TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintText: "Description",
                        focusColor: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.currency_rupee,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Container(
                  width: 190.w,
                  height: 30.h,
                  child: Center(
                    child: TextFormField(
                      controller: spendController,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        hintText: "Spend",
                        focusColor: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 190.w,
                    height: 30.h,
                    child: Row(
                      children: [
                        Text("Paid By"),
                        SizedBox(
                          width: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            //show Dialog wit friends list
                          },
                          child: Container(
                            // height: 40,
                            // width: 60,
                            constraints: BoxConstraints(maxWidth: 100.w),
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.mainAppColor),
                            child: Center(child: Text("You")),
                          ),
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
