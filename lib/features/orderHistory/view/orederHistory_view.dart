import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/customButton.dart';

class OrderhistoryView extends StatelessWidget {
  const OrderhistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order History')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/test/test.png",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order #${index + 1}"),
                              Text("Date: 2024-06-0${index + 1}"),
                              Text("Total: \$${(index + 1) * 20}.00"),
                            ],
                          ),
                        ],
                      ),
                      Gap(20),
                      Custombutton(
                        text: 'Reorder',
                        color: AppColors.primaryColor.withOpacity(0.2),
                        width: double.infinity,
                        ontap: () {
                          // Reorder action
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
