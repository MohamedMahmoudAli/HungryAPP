import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int sliderValue = 0;

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
        child: Column(
          children: [
            Gap(20),
            Row(
              children: [
                Image.asset(
                  'assets/productView/burger.png',
                  height: 200,
                  width: 150,
                ),
                Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Classic Burger',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(10),
                    Text(
                      '\$5.99',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    Slider(
                      value: sliderValue.toDouble(),
                      min: 0,
                      max: 15,
                      divisions: 10,
                      label: sliderValue.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value.toInt();
                        });
                      },
                    ),

                    Row(children: [Text("🥶"), Spacer(), Text("🌶️")]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
