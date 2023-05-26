import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splitbuddie/common/widgets/bottom_bar.dart';
import 'package:splitbuddie/common/widgets/custom_button.dart';
import 'package:splitbuddie/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/Home/screens/home_page.dart';
import 'package:splitbuddie/features/auth/screens/signin_screen.dart';
import 'package:splitbuddie/features/auth/screens/signup_screen.dart';
import 'package:splitbuddie/features/auth/services/auth_services.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService authService = AuthService();
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _mobController.dispose();
  }

  void signupUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      mob: _mobController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDBECF6),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset(
                "assets/images/new-logo.png",
                height: 120.h,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              "Welcome to SplitBuddie",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.mainAppFaintColor),
            ),
            SizedBox(
              height: 120.h,
            ),
            
            CustomButton(
              color: const Color(0xff5BC7EC),
              text: "Sign Up",
              onPressed: () {
                Navigator.pushNamed(context, SignupScreen.routeName);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                color: Color(0xff5BC7EC),
                text: "Log In",
                onPressed: () {
                  Navigator.pushNamed(context, SigninScreen.routeName);
                }
                // Navigator.push(context, MaterialPageRoute(builder: (ctx) => BottomBar()));
                // },
                ),
            // SizedBox(
            //   height: 350.h,
            // ),
            // const Text(
            //   "Terms | Privacy Policy | Contact Us",
            //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.mainAppFaintColor),
            // ),
          ],
        ),
      ),
    );
  }
}
