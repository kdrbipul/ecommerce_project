import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/models/product.dart';
import 'package:ecommerce_project/data/models/product_list_by_category_model.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductListByCategoryController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<Product> _productList = [];

  bool get inProgress => _inProgress;

  List<Product> get productList => _productList;

  String get errorMessage => _errorMessage;

  Future<bool> getProductList(int categoryId) async {
    bool _isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productListByCategory(categoryId));
    if (response.isSuccess) {
      _productList = ProductListByCategoryModel.fromJson(response.responseData)
              .productList ??
          [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return _isSuccess;
  }
}
