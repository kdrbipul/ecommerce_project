import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_project/widgets/product_image_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
      body: const Column(
        children: [
          ProductImageCarouselSlider()
        ],
      ),
    );
  }
}
