import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
  });
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      textScaler: TextScaler.linear(1.0),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}
