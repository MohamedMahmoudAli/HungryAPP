import 'package:flutter/material.dart';
import 'package:hungry/shared/customText.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
    required this.tiile,
    required this.price,
    required this.bold,
    required this.Issmall,
  });
  final String tiile;
  final String price;
  final bool bold, Issmall;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: tiile,
          size: Issmall ? 12 : 18,
          color: bold ? Colors.black : Colors.grey.shade400,
          weight: bold ? FontWeight.bold : FontWeight.w600,
        ),
        CustomText(
          text: "\$$price",
          size: Issmall ? 12 : 18,
          color: bold ? Colors.black : Colors.grey.shade400,
          weight: bold ? FontWeight.bold : FontWeight.w600,
        ),
      ],
    );
  }
}
