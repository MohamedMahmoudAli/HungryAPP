import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/Widgets/RemoveButton%20.dart';
import 'package:hungry/features/cart/Widgets/qauntaty_widget.dart';
import 'package:hungry/shared/customText.dart';

class card_item extends StatelessWidget {
  const card_item({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/test/test.png', height: 100, width: 100),
                Gap(10),
                Customtext(text: "Hamburger ", fontWeight: FontWeight.bold),
                Gap(5),
                Customtext(text: "Veggie Burger ", fontWeight: FontWeight.w500),
              ],
            ),
            Spacer(),
            Column(children: [QuantityWidget(), Gap(20), RemoveButton()]),
          ],
        ),
      ),
    );
  }
}
