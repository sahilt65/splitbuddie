import 'package:splitbuddie/common/widgets/bottom_bar.dart';
import 'package:splitbuddie/common/widgets/custom_button.dart';
import 'package:splitbuddie/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:splitbuddie/constants/colors.dart';
import 'package:splitbuddie/features/Home/screens/home_page.dart';
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

  void signupUser()async {
    await authService.signUpUser(
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
      backgroundColor: Colors.black,
      body: SafeArea(
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
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.mainAppFaintColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  tileColor: Colors.black,
                  //  _auth == Auth.signUp ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundColor,
                  title: const Text(
                    "Create Account",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    selectionColor: AppColors.mainAppFaintColor,
                  ),
                  leading: Radio(
                      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return AppColors.mainAppColor.withOpacity(.32);
                        }
                        return AppColors.mainAppColor;
                      }),
                      activeColor: AppColors.mainAppFaintColor,
                      value: Auth.signUp,
                      groupValue: _auth,
                      onChanged: (Auth? value) {
                        setState(() {
                          _auth = value!;
                        });
                      }),
                ),
                if (_auth == Auth.signUp)
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
                              textInputType: TextInputType.emailAddress),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            color: AppColors.mainAppColor,
                            text: "Sign Up",
                            onPressed: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                print("Sahil");
                                signupUser();
                              }
                              // Navigator.push(context, MaterialPageRoute(builder: (ctx) => BottomBar()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  // tileColor: Colors.yellow,
                  // _auth == Auth.signIn ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundColor,
                  title: const Text(
                    "Sign in",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  leading: Radio(
                      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return AppColors.mainAppColor.withOpacity(.32);
                        }
                        return AppColors.mainAppColor;
                      }),
                      activeColor: AppColors.mainAppFaintColor,
                      value: Auth.signIn,
                      groupValue: _auth,
                      onChanged: (Auth? value) {
                        setState(() {
                          _auth = value!;
                        });
                      }),
                ),
                if (_auth == Auth.signIn)
                  Container(
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
                            text: "Sign In",
                            onPressed: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
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
    );
  }
}
