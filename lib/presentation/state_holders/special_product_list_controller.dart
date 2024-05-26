import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/models/product.dart';
import 'package:ecommerce_project/data/models/product_list_model.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductListController extends GetxController {
  bool _inProgress = false;
  List<Product> _productList = [];

  String _errorMessage = '';

  bool get inProgress => _inProgress;

  List<Product> get productList => _productList;

  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProductList() async {
    bool isSuccess = false;
    _inProgress = false;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.listProductByRemark('Special'),
    );
    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
