import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/view/signup_view.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/customButton.dart';
import 'package:hungry/shared/customText.dart';
import 'package:hungry/shared/customTextFormField.dart';
import 'package:hungry/shared/custom_snack.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'Sonic3@gmail.com');
  final passController = TextEditingController(text: '123456789');
  bool isLoading = false;
  final authRepo = AuthRepo();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => isLoading = true);

    try {
      final user = await authRepo.login(
        emailController.text.trim(),
        passController.text.trim(),
      );
      if (user != null)
        Navigator.push(context, MaterialPageRoute(builder: (_) => RootState()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(customSnack(e));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: Form(
              key: formKey,
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
                                controller: passController,
                              ),
                              Gap(40),
                              isLoading
                                  ? CupertinoActivityIndicator(
                                      color: Colors.white,
                                    )
                                  : Custombutton(
                                      text: "Log In",
                                      color: Colors.white,
                                      textcolor: AppColors.primaryColor,
                                      ontap: login,
                                    ),
                              Gap(20),
                              Custombutton(
                                text: "Create Account",
                                color: AppColors.primaryColor,
                                textcolor: Colors.white,
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (c) => SignupView(),
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
      ),
    );
  }
}
