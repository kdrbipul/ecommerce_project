import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/presentation/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({super.key});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
 late int _currentValue;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      surfaceTintColor: Colors.white,
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: _buildProductDetails(),
          )
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductName(),
                    _buildProductCategory(),
                  ],
                ),
              ),
            ),
            _buildProductIconButton(),
          ],
        ),
        _buildProductCartBottomContent(),
      ],
    );
  }

  Widget _buildProductCartBottomContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '\$400',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          _buildItemItemCount(),
        ],
      ),
    );
  }

  Widget _buildProductIconButton() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.delete_outline,
      ),
    );
  }

  Widget _buildProductCategory() {
    return const Wrap(
      spacing: 16,
      children: [
        Text(
          'Color: Red',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        Text(
          'Size: xl',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildProductName() {
    return const Text(
      'Nike Shoe 234555',
      maxLines: 1,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
          overflow: TextOverflow.ellipsis),
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

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        AssetsPath.productShoeSvg,
        width: 120,
      ),
    );
  }
}
