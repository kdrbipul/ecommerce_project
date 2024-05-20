import 'package:ecommerce_project/data/models/home_slider_data.dart';

class HomeSliderListModel {
  String? msg;
  List<HomeSliderData>? sliderList;

  HomeSliderListModel({this.msg, this.sliderList});

  HomeSliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderList = <HomeSliderData>[];
      json['data'].forEach((v) {
        sliderList!.add(HomeSliderData.fromJson(v));
      });
    }
  }

}

