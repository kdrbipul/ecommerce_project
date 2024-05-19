import 'package:ecommerce_project/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/presentation/utils/assets_path.dart';
import 'package:ecommerce_project/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.showAddToWishList = true,
  });

  final bool showAddToWishList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => const ProductDetailsScreen());
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
        child: SvgPicture.asset(AssetsPath.productShoeSvg),
      ),
    );
  }

  Widget _buildProductCardText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nike sports shoe 320k special edition',
          maxLines: 1,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey),
        ),
        Wrap(
          spacing: 17,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              '\$30',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
            Wrap(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                Text(
                  '3.4',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            WishButton()
          ],
        )
      ],
    );
  }
}
