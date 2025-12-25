class CartModel {
  final int productId;
  final int qty;
  final double spicy;
  final List<int> toppings;
  final List<int> options;

  CartModel({
    required this.productId,
    required this.qty,
    required this.spicy,
    required this.toppings,
    required this.options,
  });

  Map<String, dynamic> tojson() => {
    "product_id": productId,
    "quantity": qty,
    "spicy": spicy,
    "toppings": toppings,
    "side_options": options,
  };
}

class CartRequestModel {
  final List<CartModel> items;

  CartRequestModel({required this.items});

  Map<String, dynamic> tojson() => {
    "items": items.map((e) => e.tojson()).toList(),
  };
}

class GetCartResponse {
  final int id;
  final String message;
  final CartData cartData;

  GetCartResponse({
    required this.id,
    required this.message,
    required this.cartData,
  });

  factory GetCartResponse.fromJson(Map<String, dynamic> json) {
    return GetCartResponse(
      id: json['code'] ?? 200,
      message: json['message'].toString(),
      cartData: CartData.fromJson(json['data']),
    );
  }
}

class CartData {
  final int id;
  final double totalPrice;
  final List<CartItemModel> items;

  CartData({required this.id, required this.totalPrice, required this.items});

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['id'],
      totalPrice: double.parse(json['total_price'].toString()),
      items: (json['items'] as List)
          .map((e) => CartItemModel.fromjson(e))
          .toList(),
    );
  }
}

class CartItemModel {
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final double price;
  final double spicy;

  CartItemModel({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.spicy,
  });

  factory CartItemModel.fromjson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['item_id'],
      productId: json['product_id'],
      name: json['name'],
      image: json['image'],
      quantity: json['quantity'],
      price: double.parse(json['price'].toString()),
      spicy: double.parse(json['spicy'].toString()),
    );
  }
}
