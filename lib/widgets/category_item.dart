import 'package:ecommerce_project/data/models/category.dart';
import 'package:ecommerce_project/presentation/screens/product_list_screen.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(
          () =>  ProductListScreen(categoryName: category.categoryName ?? ''),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: NetworkImageWidget(
              url: category.categoryImg ?? '',
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(height: 6),
           Text(
            category.categoryName ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
              letterSpacing: 0.4,
            ),
          )
        ],
      ),
    );
  }
}
