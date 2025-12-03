import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/product/widget/spicy_Slider.dart';
import 'package:hungry/features/product/widget/toppings_item.dart';
import 'package:hungry/features/product/widget/total_bar.dart';
import 'package:hungry/shared/customText.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int sliderValue = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              SpicySlider(
                sliderValue: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value.toInt();
                  });
                },
              ),
              Gap(30),
              Customtext(
                text: 'Toppings',
                size: 22,
                fontWeight: FontWeight.bold,
              ),
              Gap(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    15,
                    (context) => Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ToppingsItem(
                        ontap: () {
                          print('Topping ${context + 1} tapped');
                        },
                        image: 'assets/test/topping.png',
                        title: 'Topping ${context + 1}',
                      ),
                    ),
                  ),
                ),
              ),
              Gap(30),
              Customtext(
                text: 'Side options',
                size: 22,
                fontWeight: FontWeight.bold,
              ),
              Gap(10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    15,
                    (context) => Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ToppingsItem(
                        ontap: () {
                          print('Topping ${context + 1} tapped');
                        },
                        image: 'assets/test/topping.png',
                        title: 'Topping ${context + 1}',
                      ),
                    ),
                  ),
                ),
              ),
              TotalBar(total: 30, onAddToCart: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
