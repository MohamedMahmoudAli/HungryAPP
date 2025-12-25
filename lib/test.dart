import 'package:flutter/material.dart';
import 'package:hungry/features/cart/data/repo/cart_repo.dart';

class CartApiTestPage extends StatefulWidget {
  const CartApiTestPage({super.key});

  @override
  State<CartApiTestPage> createState() => _CartApiTestPageState();
}

class _CartApiTestPageState extends State<CartApiTestPage> {
  bool isLoading = false;
  String result = '';

  Future<void> testApi() async {
    setState(() {
      isLoading = true;

      result = '';
    });

    try {
      CartRepo cartRepo = CartRepo();
      var res = cartRepo.GetCart();
      print("==============================");
      print("==============the result ================");
      print(res);
      setState(() {
        //   result =
        //       // 'Cart ID: ${res.cartData.id}\n'
        //       // 'Total Price: ${response.cartData.totalPrice}\n'
        //       // 'Items Count: ${response.cartData.items.length}';
        //
      });

      // debugPrint('Cart Data: ${res.cartData}');
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Test Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: isLoading ? null : testApi,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Test API Response'),
              ),
              const SizedBox(height: 20),
              Text(result, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
