import 'package:ecommerce_project/data/models/wish_list_item.dart';

class WishListModel {
  String? msg;
  List<WishListItem>? wistList;

  WishListModel({this.msg, this.wistList});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wistList = <WishListItem>[];
      json['data'].forEach((v) {
        wistList!.add(WishListItem.fromJson(v));
      });
    }
  }

}


