import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/customText.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  List<String> Categorys = ["All", "Combos", "sliders", "classic"];
  int selectedIndex = 0;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Gap(75),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/logo/hungry.svg",
                        color: AppColors.primaryColor,
                        height: 35,
                      ),
                      Gap(5),
                      Customtext(
                        text: 'Hello, Rich Sonic',
                        size: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(radius: 30),
                ],
              ),
              Gap(20),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(12),
                shadowColor: Colors.grey,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                    hintText: "Search ",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Gap(30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(Categorys.length, (index) {
                    return GestureDetector(
                      onTap: () => setState(() {
                        selectedIndex = index;
                      }),
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 27,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? AppColors.primaryColor
                              : Color(0xffF3F4F6),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Customtext(
                          text: Categorys[index],
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
