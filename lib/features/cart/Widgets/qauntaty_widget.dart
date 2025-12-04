import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int count = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Minus Button
        InkWell(
          onTap: () {
            setState(() {
              if (count > 0) count--;
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF063F1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.remove, color: Colors.white, size: 28),
          ),
        ),

        const SizedBox(width: 20),

        // Number
        Text(
          "$count",
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),

        const SizedBox(width: 20),

        // Plus Button
        InkWell(
          onTap: () {
            setState(() {
              count++;
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF063F1E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
        ),
      ],
    );
  }
}
