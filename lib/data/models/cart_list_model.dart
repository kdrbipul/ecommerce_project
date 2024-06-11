import 'cart_list_item.dart';

class CartListModel {
  String? msg;
  List<CartListItem>? cartList;

  CartListModel({this.msg, this.cartList});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartList = <CartListItem>[];
      json['data'].forEach((v) {
        cartList!.add(CartListItem.fromJson(v));
      });
    }
  }

}


