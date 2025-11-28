import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:hungry/core/constants/app_colors.dart';

class SpalshView extends StatelessWidget {
  const SpalshView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(250),
          SvgPicture.asset("assets/logo/hungry.svg"),
          Spacer(),
          Center(child: Image.asset("assets/splash/splash.png")),
        ],
      ),
    );
  }
}
