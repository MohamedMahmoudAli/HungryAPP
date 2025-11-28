import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/customButton.dart';
import 'package:hungry/shared/customText.dart';
import 'package:hungry/shared/customTextFormField.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gap(100),
                  SvgPicture.asset("assets/logo/hungry.svg"),
                  Gap(10),
                  Customtext(
                    text: "Welcome Back Discover Delcious Food",
                    color: Colors.white,
                    size: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  Gap(50),
                  Customtextformfield(
                    hintText: "Email",
                    isPassword: false,
                    controller: emailController,
                  ),
                  Gap(20),
                  Customtextformfield(
                    hintText: 'Password',
                    isPassword: true,
                    controller: passwordController,
                  ),
                  Gap(40),
                  Custombutton(
                    text: "Log In",
                    ontap: () {
                      if (_formKey.currentState!.validate()) {
                        print("Login Successful");
                      }
                    },
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
