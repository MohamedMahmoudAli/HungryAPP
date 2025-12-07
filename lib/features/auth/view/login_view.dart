import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/root.dart';
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
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(100),
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
                Gap(120),
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
                            Gap(30),
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
                              color: Colors.white,
                              textcolor: AppColors.primaryColor,
                              ontap: () {
                                if (_formKey.currentState!.validate()) {
                                  print("Login Successful");
                                }
                              },
                            ),
                            Gap(20),
                            Custombutton(
                              text: "Create Account",
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
                            Gap(10),
                            GestureDetector(
                              onDoubleTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => RootState(),
                                  ),
                                );
                              },
                              child: Text(
                                "Conutinue As Guest?",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
