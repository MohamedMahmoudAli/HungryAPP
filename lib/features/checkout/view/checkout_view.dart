import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/features/auth/data/auth_model.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/checkout/widgets/orderDetails.dart';
import 'package:hungry/features/checkout/widgets/order_summary_widget.dart';
import 'package:hungry/features/checkout/widgets/succes_dialog.dart'
    show PaymentSuccessView, ScuessDialog;
import 'package:hungry/shared/customText.dart';
import 'package:hungry/shared/custom_snack.dart';
import 'package:hungry/shared/total_bar.dart';

class CheckoutView extends StatefulWidget {
  CheckoutView({super.key, required this.totalPrice});
  final String totalPrice;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedmethod = 'Cash';
  AuthRepo authRepo = AuthRepo();

  UserModel? userModel;
  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      setState(() {
        userModel = user;
      });
    } catch (e) {
      String errorMsg = 'Error in Profile';
      if (e is ApiError) {
        errorMsg = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(customSnack(errorMsg));
    }
  }

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Order summary", size: 20),
            Gap(20),
            Orderdetails(
              order: widget.totalPrice,
              Taxes: '.3',
              delievrFees: '1.5',
              total: '${double.parse(widget.totalPrice) + 0.3 + 1.5 + 40}',
              deliveryTime: '15 - 30 mins',
            ),

            Gap(50),
            CustomText(
              text: "Payment methods",
              size: 20,
              weight: FontWeight.bold,
            ),
            Gap(20),
            ListTile(
              onTap: () {
                setState(() {
                  selectedmethod = 'Cash';
                });
              },
              leading: Image.asset(
                "assets/test/dollar Background Removed 1.png",
              ),
              tileColor: Color(0xff3C2F2F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.all(10),
              title: CustomText(text: "Cash on Delivery", color: Colors.white),
              trailing: Radio<String>(
                value: "Cash",
                activeColor: Colors.white,
                groupValue: selectedmethod,
                onChanged: (v) {
                  setState(() {
                    selectedmethod = v!;
                  });
                },
              ),
            ),
            Gap(10),
            userModel?.visa == null
                ? SizedBox.shrink()
                : ListTile(
                    onTap: () {
                      setState(() {
                        selectedmethod = 'Visa';
                      });
                    },
                    leading: Image.asset("assets/test/visa.png"),
                    tileColor: Colors.blue.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    title: CustomText(text: "Debit Card", color: Colors.white),
                    subtitle: CustomText(
                      text: "${userModel!.visa}?? **** **** 0022",
                      color: Colors.white,
                    ),
                    trailing: Radio<String>(
                      value: "Visa",
                      activeColor: Colors.white,
                      groupValue: selectedmethod,
                      onChanged: (v) {
                        setState(() {
                          selectedmethod = v!;
                        });
                      },
                    ),
                  ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Checkbox(
                    value: true,
                    onChanged: (d) {},
                    checkColor: Colors.white,
                    activeColor: Color(0xffEF2A39),
                  ),
                ),
                CustomText(
                  text: 'Save card details for future payments',
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 20,
              offset: Offset(0, 1),
            ),
          ],
        ),
        height: 100,
        child: TotalBar(
          total: double.parse(widget.totalPrice) + 0.3 + 1.5 + 40,
          title: "Pay Now",
          onAddToCart: () {
            print("========================");
            showAdaptiveDialog(
              context: context,
              builder: (context) => PaymentSuccessView(),
            );
          },
        ),
      ),
    );
  }
}
