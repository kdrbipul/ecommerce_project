import 'package:ecommerce_project/data/models/product.dart';
import 'package:ecommerce_project/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.showAddToWishList = true,
    required this.product,
  });

  final bool showAddToWishList;
  final Product product;

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: (){
        Get.to(() =>  ProductDetailsScreen(productId: product.id!,));
      },
      child: Card(
        elevation: 3,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              _buildProductCardContainer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildProductCardText(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCardContainer() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(product.image ?? ''),
      ),
    );
  }

  Widget _buildProductCardText() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title ?? '',
          maxLines: 1,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey),
        ),
         Wrap(
          spacing: 4,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
             Wrap(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                Text(
                  '${product.star}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const WishButton()
          ],
        )
      ],
    );
  }
}
