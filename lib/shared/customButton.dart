import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/customText.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, this.ontap, required this.text});
  final Function()? ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Customtext(
            text: text,
            color: AppColors.primaryColor,
            size: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
