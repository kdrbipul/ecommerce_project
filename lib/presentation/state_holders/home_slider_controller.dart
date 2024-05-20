import 'package:ecommerce_project/data/models/home_slider_data.dart';
import 'package:ecommerce_project/data/models/home_slider_list_model.dart';
import 'package:ecommerce_project/data/models/network_response.dart';
import 'package:ecommerce_project/data/network_caller/network_caller.dart';
import 'package:ecommerce_project/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<HomeSliderData> _sliderList = [];

  bool get inProgress => _inProgress;

  List<HomeSliderData> get sliderList => _sliderList;

  String get errorMessage => _errorMessage;

  Future<bool> getSlider() async {
    bool _isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.homeSlider);
    if (response.isSuccess) {
      _sliderList =
          HomeSliderListModel.fromJson(response.responseData).sliderList ?? [];
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return _isSuccess;
  }
}
