import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart' show AppColors;
import 'package:hungry/features/auth/data/auth_model.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/features/cart/Widgets/card_item.dart';
import 'package:hungry/features/cart/data/model/cart_model.dart';
import 'package:hungry/features/cart/data/repo/cart_repo.dart';
import 'package:hungry/features/checkout/view/checkout_view.dart';
import 'package:hungry/shared/customButton.dart';
import 'package:hungry/shared/customText.dart';
import 'package:hungry/shared/custom_snack.dart';
import 'package:hungry/shared/total_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int itemCount = 9;
  bool isGuest = false;

  late List<int> quantities;
  GetCartResponse? getCartResponse;
  CartRepo cartRepo = CartRepo();
  bool isloadingremove = false;
  AuthRepo authRepo = AuthRepo();
  UserModel? userModel;

  Future<void> autoLogin() async {
    final user = await authRepo.autoLogin();
    setState(() => isGuest = authRepo.isGuest);
    if (user != null) setState(() => userModel = user);
  }

  Future<void> deleteCartData(int id) async {
    try {
      setState(() {
        isloadingremove = true;
      });
      final res = await cartRepo.RemoveCartItem(id);
      getCart();
      setState(() {
        isloadingremove = false;
      });
      customSnack("suscess");
    } catch (e) {
      setState(() {
        isloadingremove = false;
      });
      customSnack(e.toString());
    }
  }

  Future<void> getCart() async {
    try {
      final res = await cartRepo.GetCart();
      setState(() {
        getCartResponse = res;

        quantities = List.generate(res!.cartData.items.length, (_) => 1);
      });
    } catch (e) {
      print("**************************");
      print(e.toString());
    }
  }

  @override
  void initState() {
    autoLogin();
    getCart();
    quantities = List.generate(itemCount, (_) => 1);
    super.initState();
  }

  void onAdd(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void onMin(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (getCartResponse == null) return CupertinoActivityIndicator();
    if (!isGuest)
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: SizedBox.shrink(),
          centerTitle: true,
          title: CustomText(
            text: 'My Cart',
            color: Colors.black87,
            weight: FontWeight.w600,
            size: 20,
          ),
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                clipBehavior: Clip.none,
                padding: const EdgeInsets.only(bottom: 140, top: 10),
                itemCount: getCartResponse?.cartData.items.length ?? 0,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = getCartResponse?.cartData.items[index];
                  if (item == null) {
                    return CupertinoActivityIndicator(color: AppColors.primary);
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(3, 3),
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: CartItem(
                        isloading: isloadingremove,
                        image: item.image,
                        text: item.name,
                        desc: item.name,
                        number: quantities[index],
                        onAdd: () => onAdd(index),
                        onMin: () => onMin(index),
                        onRemove: () async {
                          await deleteCartData(item.itemId);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // Floating total bar
            Positioned(
              right: -10,
              left: -10,
              bottom: -20,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.8),
                      AppColors.primary.withOpacity(0.8),
                      AppColors.primary,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.9),
                  //     blurRadius: 3,
                  //     offset: const Offset(2, 3),
                  //   ),
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.9),
                  //     blurRadius: 800,
                  //     offset: const Offset(300, 50),
                  //   ),
                  // ],
                ),
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Gap(8),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CheckoutView(
                            totalPrice:
                                "${getCartResponse!.cartData.totalPrice}",
                          ),
                        ),
                      ),
                      child: CustomButton(
                        height: 45,
                        text: 'Checkout',
                        gap: 80,
                        widget: CustomText(
                          text:
                              '${getCartResponse!.cartData.totalPrice}' ??
                              "0.0",
                          size: 14,
                        ),
                        color: Colors.white,
                        width: double.infinity,
                        textColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    else if (isGuest) {
      return Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Guest Mode')),
            Gap(20),
            CustomButton(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (c) => LoginView()),
              ),
              text: 'Go to Login',
            ),
          ],
        ),
      );
    }
    return SizedBox();
  }
}
