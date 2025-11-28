import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/customText.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Gap(75),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/logo/hungry.svg",
                    color: AppColors.primaryColor,
                    height: 35,
                  ),
                  Gap(5),
                  Customtext(
                    text: 'Hello, Rich Sonic',
                    size: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(radius: 30),
            ],
          ),
        ],
      ),
    );
  }
}
