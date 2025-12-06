import 'package:flutter/material.dart';
import 'package:hungry/features/cart/Widgets/card_item.dart';
import 'package:hungry/features/checkout/view/checkout_view.dart';
import 'package:hungry/shared/total_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 100,
          right: 15.0,
          left: 15.0,
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const card_item();
          },
        ),
      ),
      bottomSheet: Container(
        height: 100,
        child: TotalBar(total: 45.99, onAddToCart: () {}),
      ),
    );
  }
}
