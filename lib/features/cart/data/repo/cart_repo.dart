import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/network/api_services.dart';
import 'package:hungry/features/cart/data/model/cart_model.dart';

class CartRepo {
  ApiService apiService = ApiService();
  Future<void> addToCart(CartRequestModel cartData) async {
    try {
      final res = await apiService.post("/cart/add", cartData.tojson());
      print(res);
      print("-------------------------------------");
      throw ApiError(message: "Product Added sucess ");
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  // get cart
  Future<GetCartResponse?> GetCart() async {
    try {
      final res = await apiService.get("/cart");
      if (res is ApiError) {
        throw ApiError(message: res.message);
      }
      return GetCartResponse.fromJson(res);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<void> RemoveCartItem(int id) async {
    try {
      final res = await apiService.delete("/cart/remove/$id", {});
      if (res['code'] == 200 && res['data'] == null) {
        throw ApiError(message: res['message']);
      }
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
