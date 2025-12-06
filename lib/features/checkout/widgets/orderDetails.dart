import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/checkout/widgets/order_summary_widget.dart'
    show OrderSummaryWidget;

class Orderdetails extends StatelessWidget {
  const Orderdetails({
    super.key,
    required this.order,
    required this.Taxes,
    required this.delievrFees,
    required this.total,
    required this.deliveryTime,
  });
  final String order, Taxes, delievrFees, total, deliveryTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderSummaryWidget(
          tiile: "order",
          price: '16.48',
          bold: false,
          Issmall: false,
        ),
        Gap(20),
        OrderSummaryWidget(
          tiile: "Taxes",
          price: '0.3',
          bold: false,
          Issmall: false,
        ),
        Gap(20),
        OrderSummaryWidget(
          tiile: "Delivery fees",
          price: '1.5',
          bold: false,
          Issmall: false,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: Divider(thickness: 1, color: Colors.grey[300]),
        ),
        OrderSummaryWidget(
          bold: true,
          tiile: 'Total',
          price: '20',
          Issmall: false,
        ),
        Gap(10),
        OrderSummaryWidget(
          bold: true,
          tiile: 'Estimated delivery time:',
          price: ' 15 - 30 mins',
          Issmall: true,
        ),
      ],
    );
  }
}
