import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ToppingsItem extends StatelessWidget {
  final String image;
  final String title;
  final Function ontap;

  const ToppingsItem({
    super.key,
    required this.image,
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 140,
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xff3B2B2B),
          borderRadius: BorderRadius.circular(25),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),

                  child: Image.asset(
                    height: 80,
                    image,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                // Gap(10),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // TEXT
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Gap(10),
                      GestureDetector(
                        onTap: ontap(),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ), // space for + button
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        // IMAGE (top)

        // BOTTOM DARK BAR

        // FLOATING + BUTTON
      ),
    );
  }
}
