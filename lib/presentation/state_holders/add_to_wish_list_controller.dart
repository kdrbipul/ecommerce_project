import 'package:ecommerce_project/data/models/cart_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToWishListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getAddToWishList(int productId) async {
    bool _isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.createWishList(productId),
    );
    if (response.isSuccess) {
      _isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return _isSuccess;
  }
}
