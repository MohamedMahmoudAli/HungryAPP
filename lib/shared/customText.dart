import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  Customtext({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight,
  });
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      textScaler: TextScaler.linear(1.0),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
