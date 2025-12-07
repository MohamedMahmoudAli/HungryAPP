import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/login_view.dart';
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
                            Custombutton(
                              text: "Sign Up",
                              color: Colors.white,
                              textcolor: AppColors.primaryColor,

                              ontap: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                            ),
                            Gap(20),
                            Custombutton(
                              text: "Go to Login",
                              color: AppColors.primaryColor,
                              textcolor: Colors.white,

                              ontap: () {
                                Navigator.push(
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
