import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/home/widgets/card_item.dart';
import 'package:hungry/features/home/widgets/food_catgories.dart';
import 'package:hungry/features/home/widgets/sreach_filed.dart';
import 'package:hungry/features/home/widgets/user_header.dart';
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              floating: false,
              scrolledUnderElevation: 0,
              toolbarHeight: 130,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(children: [Gap(75), UserHeader()]),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    Gap(20),
                    SearchField(),
                    Gap(30),
                    FoodCatgories(
                      Categorys: Categorys,
                      selectedIndex: selectedIndex,
                    ),
                    Gap(30),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.62,
                  mainAxisSpacing: 6,
                ),
                itemBuilder: (context, index) => CardItem(
                  image: 'assets/test/test.png',
                  desc: 'Wendy\'s Burger',
                  name: 'Cheeseburger ',
                  rate: "⭐ 4.9",
                ),
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
