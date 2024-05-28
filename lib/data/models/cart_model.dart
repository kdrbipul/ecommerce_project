class CartModel {


final int productId;
final String color;
final String sizes;
final int quantity;

  CartModel(
      {required this.productId,
      required this.color,
      required this.sizes,
      required this.quantity,
      });

  Map<String, dynamic> toJson() {
    return {
      "product_id":productId,
      "color":color,
      "size":sizes,
      "qty":quantity,
    };
  }
}