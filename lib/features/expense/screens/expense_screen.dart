import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/expense/models/expense_models.dart';
import 'package:splitbuddie/features/expense/screens/add_expense_screem.dart';
import 'package:splitbuddie/features/expense/services/expense_services.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});
  static const String routeName = "/expense";

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  ExpenseServices expenseServices = ExpenseServices();
  Expense? expense;
  bool isLoaded = false;
  String userId = "";
  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId = pref.getString("id")!;
  }

  void getExpense() async {
    expense = await expenseServices.getExpenseDetails(groupId: "645e0b0ba5dcfd1958d2fcc0", context: context);

    if (expense != null) {
      setState(() {
        print("----2edwefc");
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExpense();
    getUserId();
  }

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
                if (isLoaded)
                  if (userId == expense!.payer)
                    Padding(
                      padding: EdgeInsets.only(left: 60.w),
                      child: Text("You will be paid ₹${expense!.totalExpense} from your friends"),
                    ),
                if (isLoaded)
                  if (userId != expense!.payer)
                  Padding(
                    padding: EdgeInsets.only(left: 60.w),
                    child: Text("You have to pay ₹${expense!.friendsList![0].spend} to others"),
                  ),
                SizedBox(
                  height: 20.h,
                ),
                isLoaded
                    ? 
                    
                     Padding(
                        padding: EdgeInsets.only(left: 50.w),
                        child: ListView.builder(
                            itemCount: expense!.friendsList!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Container(
                                  child: Row(children: [
                                    Text(
                                      "${expense!.friendsList![index].name}",
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    Text(" will pay you ₹${expense!.friendsList![index].spend} "),
                                  ]),
                                ),
                              );
                            }),
                      )
                    : Center(
                        child: Text("These group dosent have any dues"),
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
      )),
    );
  }
}
