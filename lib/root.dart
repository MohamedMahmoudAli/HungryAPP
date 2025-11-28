import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/profile_view.dart';
import 'package:hungry/features/cart/view/cart_view.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/features/orderHistory/view/orederHistory_view.dart';

class RootState extends StatefulWidget {
  const RootState({super.key});

  @override
  State<RootState> createState() => _RootStateState();
}

class _RootStateState extends State<RootState> {
  late PageController pageController;
  late List<Widget> pages;
  int currentScreen = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: currentScreen);
    pages = [
      HomeView(),
      CartView(),
      OrderhistoryView(),
      ProfileView(),
      // Add your pages here
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,

        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent.withOpacity(0),
          currentIndex: currentScreen,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() {
              currentScreen = value;
              pageController.jumpToPage(currentScreen);
              print("the current screen is $currentScreen");
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant_sharp),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
