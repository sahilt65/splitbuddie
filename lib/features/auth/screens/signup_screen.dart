import 'package:splitbuddie/common/widgets/custom_button.dart';
import 'package:splitbuddie/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/Home/screens/home_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      // begin: Alignment(0.14107348024845123, 0.5028655529022217),
                      // end: Alignment(-0.5028655529022217, 0.2614468097686768),
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color.fromRGBO(169, 224, 243, 1),
                    Color.fromRGBO(105, 129, 202, 1),
                    Color.fromRGBO(105, 129, 202, 1)
                  ])),
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
                            "assets/images/logo.png",
                            height: 120,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Welcome to SplitBuddie",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainAppFaintColor),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // color: Colors.blac,
                          child: Form(
                            key: _signUpFormKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: _nameController,
                                  hintText: "Name",
                                  textInputType: TextInputType.name,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  controller: _emailController,
                                  hintText: "Email",
                                  textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  controller: _mobController,
                                  hintText: "Mobile Number",
                                  textInputType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                  controller: _passwordController,
                                  hintText: "Password",
                                  textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  color: AppColors.mainAppColor,
                                  text: "Sign Up",
                                  onPressed: () {
                                    if (_signUpFormKey.currentState!
                                        .validate()) {
                                      print("Sahil");
                                      // signupUser();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    }
                                  },
                                ),
                              ],
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
        });
  }
}
