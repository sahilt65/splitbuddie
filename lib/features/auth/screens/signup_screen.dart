import 'package:splitbuddie/common/widgets/custom_button.dart';
import 'package:splitbuddie/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/auth/screens/signin_screen.dart';
import 'package:splitbuddie/features/auth/services/auth_services.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService authService = AuthService();
  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _mobController.dispose();
    _confirmController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: const Color(0xffDBECF6),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      "Welcome Onboard!",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainAppFaintColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Lets hope you get your split back from buddies",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: AppColors.mainAppFaintColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 120,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      // color: Colors.blac,
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade100,
                                ),
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  controller: _nameController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: Colors.white,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 15,
                                        right: 12,
                                        top: 12,
                                        left: 12),
                                    filled: true,
                                    fillColor: Color(0xFFF2F5FD),
                                    hintText: 'Enter your full name',
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade100,
                                ),
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  controller: _emailController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: Colors.white,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 15,
                                        right: 12,
                                        top: 12,
                                        left: 12),
                                    filled: true,
                                    fillColor: Color(0xFFF2F5FD),
                                    hintText: 'Enter your email',
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade100,
                                ),
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  controller: _passwordController,
                                  obscureText: true,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: Colors.white,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 15,
                                        right: 12,
                                        top: 12,
                                        left: 12),
                                    filled: true,
                                    fillColor: Color(0xFFF2F5FD),
                                    hintText: 'Enter password',
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade100,
                                ),
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  controller: _confirmController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: Colors.white,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 15,
                                        right: 12,
                                        top: 12,
                                        left: 12),
                                    filled: true,
                                    fillColor: Color(0xFFF2F5FD),
                                    hintText: 'Confirm Password',
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade100,
                                ),
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  maxLines: 1,
                                  controller: _mobController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: Colors.white,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 15,
                                        right: 12,
                                        top: 12,
                                        left: 12),
                                    filled: true,
                                    fillColor: Color(0xFFF2F5FD),
                                    hintText: 'Phone number',
                                    hintStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              color: AppColors.mainAppColor,
                              text: "Register",
                              onPressed: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  print("Sahil");
                                  signupUser();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have account? ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.mainAppFaintColor),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SigninScreen()));
                                  },
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.lightBlueAccent),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
