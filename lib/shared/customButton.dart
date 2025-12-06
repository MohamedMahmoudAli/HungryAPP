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
  });
  final Function()? ontap;
  final String text;
  final Color? color;
  final double? width;

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
        ),
        child: Center(
          child: Customtext(
            text: text,
            color: Colors.white,
            size: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
