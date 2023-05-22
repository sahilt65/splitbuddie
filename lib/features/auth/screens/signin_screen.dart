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
  static const String routeName = '/auth-screen';
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
      backgroundColor: const Color(0xffDBECF6),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset(
                  "assets/images/logo.png",
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
              Container(
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _signInFormKey,
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
                            obscureText: true,
                            controller: _passwordController,
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
                              hintText: 'Enter Password',
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
                        text: "Login",
                        onPressed: () {
                          if (_signInFormKey.currentState!.validate()) {
                            signInUser();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.mainAppColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}