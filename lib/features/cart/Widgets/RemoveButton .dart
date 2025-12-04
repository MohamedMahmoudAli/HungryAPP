import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback? onTap;

  const RemoveButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 154,
        height: 43,
        decoration: BoxDecoration(
          color: const Color(0xFF063F1E), // Dark green color
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Remove",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
