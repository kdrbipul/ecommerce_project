import 'package:ecommerce_project/presentation/state_holders/cart_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/widgets/cart_product.dart';
import 'package:ecommerce_project/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CartListController>().getCartList();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carts'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<CartListController>(
          builder: (cartListController) {
            if(cartListController.inProgress){
              return const CenteredCircularProgressIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartListController.cartList.length,
                    itemBuilder: (context, index) {
                    return CartProduct(cartListItem: cartListController.cartList[index],);
                  },
                  ),
                ),
                _buildCheckOutWidget(cartListController.totalPrice)
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _buildCheckOutWidget(double totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTotalPriceWidget(totalPrice),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPriceWidget(double price) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Total Price',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$$price',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
