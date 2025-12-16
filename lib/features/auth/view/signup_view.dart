import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/customButton.dart';
import 'package:hungry/shared/customText.dart';
import 'package:hungry/shared/customTextFormField.dart';
import 'package:hungry/shared/custom_snack.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  AuthRepo authRepo = AuthRepo();

  Future<void> Signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() => isLoading = true);
        final user = await authRepo.signup(
          nameController.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim(),
        );
        if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => RootState()),
          );
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        String errMsg = 'Error in Register';
        if (e is ApiError) {
          errMsg = e.message;
        }
        ScaffoldMessenger.of(context).showSnackBar(customSnack(errMsg));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: Column(
              children: [
                Gap(120),
                SvgPicture.asset(
                  "assets/logo/hungry.svg",
                  color: AppColors.primaryColor,
                ),
                Gap(10),
                Customtext(
                  text: "Welcome Back Discover Delcious Food",
                  color: AppColors.primaryColor,
                  size: 12,
                  fontWeight: FontWeight.w500,
                ),
                Gap(150),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Gap(20),
                            Customtextformfield(
                              hintText: "Name",
                              isPassword: false,
                              controller: nameController,
                            ),
                            Gap(25),

                            Customtextformfield(
                              hintText: "Email Address",
                              isPassword: false,
                              controller: emailController,
                            ),

                            Gap(25),
                            Customtextformfield(
                              hintText: "password",
                              isPassword: true,
                              controller: passwordController,
                            ),

                            Gap(40),
                            isLoading
                                ? CupertinoActivityIndicator(
                                    color: Colors.white,
                                  )
                                : Custombutton(
                                    text: "Sign Up",
                                    color: Colors.white,
                                    textcolor: AppColors.primaryColor,

                                    ontap: () {
                                      Signup();
                                    },
                                  ),
                            Gap(20),
                            Custombutton(
                              text: "Go to Login",
                              color: AppColors.primaryColor,
                              textcolor: Colors.white,

                              ontap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => LoginView(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
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
