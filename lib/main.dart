import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:splitbuddie/Models/create_group_model.dart';
import 'package:splitbuddie/common/widgets/bottom_bar.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/Home/screens/home_page.dart';
import 'package:splitbuddie/features/auth/screens/auth_screen.dart';
import 'package:splitbuddie/features/auth/services/auth_services.dart';
import 'package:splitbuddie/features/groups/screens/group_info_screen.dart';
import 'package:splitbuddie/features/groups/screens/groups.dart';
import 'package:splitbuddie/features/introduction/intro_slider.dart';
import 'package:splitbuddie/providers/group_provider.dart';
import 'package:splitbuddie/providers/user_provider.dart';
import 'package:splitbuddie/routes.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => GroupProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService authService = AuthService();
  @override
  void initState() {
    authService.getUserData(context: context);
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'SplitBuddie',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: ((settings) => generateRoute(settings)),
          // home: GroupInfoScreen(
          //   groupInfo: CreateGroup(userId: '123', groupName: "Flayt Mates", groupType: "Home"),
          // ),
          home: Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? const BottomBar()
              : const AuthScreen(),
          //home: BottomBar(),
        );
      },
    );
  }
}
