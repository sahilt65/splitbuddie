import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splitbuddie/common/widgets/custom_button.dart';
import 'package:splitbuddie/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/auth/services/auth_services.dart';

enum Auth {
  signIn,
  signUp,
}

class SigninScreen extends StatefulWidget {
  static const String routeName = '/signin-screen';
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final AuthService authService = AuthService();
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
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(color: AppColors.screenBackgroundColor
            //   gradient: LinearGradient(
            //       // begin: Alignment(0.14107348024845123, 0.5028655529022217),
            //       // end: Alignment(-0.5028655529022217, 0.2614468097686768),
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //       colors: [
            //     Color.fromRGBO(169, 224, 243, 1),
            //     Color.fromRGBO(105, 129, 202, 1),
            //     Color.fromRGBO(105, 129, 202, 1)
            //   ],
            // ),
            ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 80),
                    child: Image.asset(
                      "assets/images/new-logo.png",
                      height: 120,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Welcome to SplitBuddie",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.mainAppFaintColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 10.h),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _emailController,
                              hintText: "Email",
                              textInputType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: "Password",
                              textInputType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            CustomButton(
                              color: AppColors.buttonColor,
                              text: "Sign In",
                              onPressed: () {
                                print(_emailController.text);
                                print(_nameController.text);
                                if (_signInFormKey.currentState!.validate()) {
                                  signInUser();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
