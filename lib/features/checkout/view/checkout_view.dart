import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/checkout/widgets/orderDetails.dart';
import 'package:hungry/features/checkout/widgets/order_summary_widget.dart';
import 'package:hungry/shared/customText.dart';
import 'package:hungry/shared/total_bar.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedmethod = 'Cash';

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
            Customtext(text: "Order summary", size: 20),
            Gap(20),
            Orderdetails(
              order: '16.48',
              Taxes: '.3',
              delievrFees: '1.5',
              total: '20',
              deliveryTime: '15 - 30 mins',
            ),

            Gap(50),
            Customtext(
              text: "Payment methods",
              size: 20,
              fontWeight: FontWeight.bold,
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
              title: Customtext(text: "Cash on Delivery", color: Colors.white),
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
            ListTile(
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
              title: Customtext(text: "Debit Card", color: Colors.white),
              subtitle: Customtext(
                text: "**** **** 22222",
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
                Customtext(
                  text: 'Save card details for future payments',
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 100,
        child: TotalBar(total: 45.99, onAddToCart: () {}),
      ),
    );
  }
}
