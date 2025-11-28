import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/customText.dart';

class FoodCatgories extends StatefulWidget {
  FoodCatgories({
    super.key,
    required this.Categorys,
    required this.selectedIndex,
  });
  final List<String> Categorys;

  final int selectedIndex;

  @override
  State<FoodCatgories> createState() => _FoodCatgoriesState();
}

class _FoodCatgoriesState extends State<FoodCatgories> {
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.Categorys.length, (index) {
          return GestureDetector(
            onTap: () => setState(() {
              selectedIndex = index;
            }),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 27, vertical: 15),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? AppColors.primaryColor
                    : Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Customtext(
                text: widget.Categorys[index],
                color: selectedIndex == index ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }),
      ),
    );
  }
}
