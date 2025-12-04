import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/Widgets/RemoveButton%20.dart';
import 'package:hungry/features/cart/Widgets/card_item.dart';
import 'package:hungry/features/cart/Widgets/qauntaty_widget.dart';
import 'package:hungry/shared/customText.dart';
import 'package:hungry/shared/total_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: List.generate(
                  4,
                  (context) => Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: card_item(),
                  ),
                ),
              ),
              Gap(20),
              TotalBar(
                total: 45.99,
                onAddToCart: () {
                  // Add to cart action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
