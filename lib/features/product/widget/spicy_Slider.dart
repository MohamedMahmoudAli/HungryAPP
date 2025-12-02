import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';

class SpicySlider extends StatelessWidget {
  SpicySlider({super.key, required this.sliderValue, required this.onChanged});
  final int sliderValue;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/productView/burger.png', height: 200, width: 150),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customize Your Burger \n to Your Tastes. Ultimate \n Experience',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Gap(10),
            Text(
              'Spicy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: sliderValue.toDouble(),
              min: 0,
              max: 15,
              divisions: 10,
              label: sliderValue.round().toString(),
              activeColor: AppColors.primaryColor,
              inactiveColor: Colors.grey,
              onChanged: onChanged,
            ),
            SizedBox(
              width: 200,
              child: Row(children: [Text("🥶"), Spacer(), Text("🌶️")]),
            ),
          ],
        ),
      ],
    );
  }
}
