import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/widgets/color_picker.dart';
import 'package:ecommerce_project/widgets/product_image_carousel_slider.dart';
import 'package:ecommerce_project/widgets/size_picker.dart';
import 'package:ecommerce_project/widgets/wish_button.dart';
import 'package:flutter/material.dart';
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
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            _buildItemItemCount(),
                          ],
                        ),
                        _buildReviewSection(),
                        const SizedBox(height: 8),
                        const Text(
                          'Color',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ColorPicker(colors: const [
                          Colors.black,
                          Colors.amberAccent,
                          Colors.green,
                          Colors.blue,
                          Colors.redAccent
                        ], onChange: (Color selectedColor) {}),
                        const SizedBox(height: 16),
                        const Text(
                          'Size',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizePicker(onChange: (String s){}, sizes: const[
                          'M',
                          'S',
                          'L',
                          'XL',
                          'XXL'
                        ]),
                        const SizedBox(height: 16),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                        ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          _buildAddToCartWidget(),
        ],
      ),
    );
  }

  Widget _buildAddToCartWidget() {
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
          _buildPriceWidget(),
          SizedBox(
              width: 160,
              child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add To Cart'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceWidget() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$400',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewSection() {
    return Wrap(
      spacing: 17,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
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
        TextButton(
          onPressed: () {},
          child: const Text('Review'),
        ),
        const WishButton()
      ],
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


