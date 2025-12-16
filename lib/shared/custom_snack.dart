import 'package:flutter/material.dart';
import 'package:gap/gap.dart' show Gap;

SnackBar customSnack(e) {
  return SnackBar(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
    elevation: 10,
    clipBehavior: Clip.none,

    content: Row(
      children: [
        Icon(Icons.info_outline_rounded, color: Colors.white),
        Gap(20),
        Text(e.toString()),
      ],
    ),
    backgroundColor: Colors.red.shade600,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
  );
}
