import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/widgets/product_image_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          onPressed: (){
            Get.find<MainBottomNavBarController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body:  Column(
        children: [
          const ProductImageCarouselSlider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                     Expanded(
                      child: Text(
                        'Nike Shoe 2024 Edition 8FE5889',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    _buildItemItemCount()

                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemItemCount() {
    return ItemCount(
      initialValue: _currentValue,
      minValue: 1,
      maxValue: 20,
      decimalPlaces: 0,
      color: AppColors.primaryColor,
      onChanged: (value) {
        _currentValue = value as int;
        setState(() {});
      },
    );
  }
}
