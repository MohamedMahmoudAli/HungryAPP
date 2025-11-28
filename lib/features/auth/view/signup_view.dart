import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/customButton.dart';
import 'package:hungry/shared/customText.dart';
import 'package:hungry/shared/customTextFormField.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(80),
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
                      hintText: "phone",
                      isPassword: false,
                      controller: phoneController,
                    ),
                    Gap(25),
                    Customtextformfield(
                      hintText: "password",
                      isPassword: true,
                      controller: passwordController,
                    ),
                    Gap(25),
                    Customtextformfield(
                      hintText: "confirm password",
                      isPassword: true,
                      controller: confirmPassword,
                    ),

                    Gap(40),
                    Custombutton(
                      text: "Sign Up",
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          print("Sign Up Successful");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
