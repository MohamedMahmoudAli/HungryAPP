import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/customText.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    super.key,
    this.ontap,
    required this.text,
    this.color,
    this.width,
    this.textcolor,
  });
  final Function()? ontap;
  final String text;
  final Color? color;
  final double? width;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: textcolor ?? AppColors.primaryColor),
        ),
        child: Center(
          child: Customtext(
            text: text,
            color: textcolor ?? Colors.white,
            size: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
