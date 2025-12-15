import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/customText.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.desc,
    required this.name,
    required this.rate,
  });
  final String image, desc, name, rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: -30,
                  child: Image.asset("assets/logo/shade.png"),
                ),

                Center(child: Image.asset(image, width: 120, height: 120)),
              ],
            ),
            Gap(10),
            Customtext(text: name, fontWeight: FontWeight.w600, size: 16),
            Customtext(text: desc, fontWeight: FontWeight.w300, size: 16),
            Row(
              children: [
                Customtext(text: rate),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.heart_fill),
                  iconSize: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
