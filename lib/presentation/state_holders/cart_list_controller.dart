import 'package:ecommerce_project/data/models/cart_list_item.dart';
import 'package:ecommerce_project/data/models/cart_list_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<CartListItem> _cartList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<CartListItem> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool _isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getWishList,
    );
    if (response.isSuccess) {
      _cartList = CartListModel.fromJson(response.responseData).cartList ?? [];
      _isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return _isSuccess;
  }

  double get totalPrice {
    double total = 0;
    for (CartListItem cartList in _cartList) {
      total += (cartList.qty!) *
          (double.tryParse(cartList.product?.price ?? '0') ?? 0);
    }
    return total;
  }

  void changeProductQuantity(int cartId, int quantity) {
    _cartList.firstWhere((c) => c.id == cartId).qty = quantity;
    update();
  }

  void _deleteCartItem(int cartId) {
    _cartList.removeWhere((c) => c.id == cartId);
  }

  Future<bool> deleteCartItem(int cartId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.deleteProduct(cartId));
    if(response.isSuccess){
      _deleteCartItem(cartId);
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
