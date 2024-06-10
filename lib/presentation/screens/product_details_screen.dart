import 'package:ecommerce_project/data/models/cart_model.dart';
import 'package:ecommerce_project/data/models/product_details_model.dart';
import 'package:ecommerce_project/presentation/state_holders/add_to_cart_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/add_to_wish_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_project/widgets/product_image_carousel_slider.dart';
import 'package:ecommerce_project/widgets/size_picker.dart';
import 'package:ecommerce_project/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _currentValue = 1;

  String? _selectedColor;
  String? _selectedSizes;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if (productDetailsController.inProgress) {
            return const CenteredCircularProgressIndicator();
          }

          if (productDetailsController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(productDetailsController.errorMessage),
            );
          }

          ProductDetailsModel productDetailsModel =
              productDetailsController.productDetailsModel;

          List<String> colors = productDetailsModel.color?.split(',') ?? [];
          List<String> sizes = productDetailsModel.size?.split(',') ?? [];
          _selectedSizes = sizes.first;
          _selectedColor = colors.first;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageCarouselSlider(
                        images: [
                          productDetailsModel.img1 ?? '',
                          productDetailsModel.img2 ?? '',
                          productDetailsModel.img3 ?? '',
                          productDetailsModel.img4 ?? '',
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    productDetailsModel.product?.title ?? '',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.8)),
                                  ),
                                ),
                                _buildItemItemCount(),
                              ],
                            ),
                            _buildReviewSection(productDetailsModel),
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
                            /* ColorPicker(colors: const [
                            Colors.black,
                            Colors.amberAccent,
                            Colors.green,
                            Colors.blue,
                            Colors.redAccent
                          ], onChange: (Color selectedColor) {},
                          ),*/
                            SizePicker(
                              onChange: (String s) {
                                _selectedColor = s;
                              },
                              sizes: colors,
                              isRounded: false,
                            ),
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
                            SizePicker(
                              onChange: (String s) {
                                _selectedSizes = s;
                              },
                              sizes: sizes,
                            ),
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
                            Text(
                              productDetailsModel.product?.shortDes ?? '',
                            ),
                            const SizedBox(height: 8),
                            Text(
                              productDetailsModel.des ?? '',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _buildAddToCartWidget(productDetailsModel),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAddToCartWidget(ProductDetailsModel productDetailsModel) {
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
          _buildPriceWidget(productDetailsModel),
          SizedBox(
            width: 160,
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              if (addToCartController.inProgress) {
                return const CenteredCircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: () {
                  CartModel cartModel = CartModel(
                    productId: widget.productId,
                    color: _selectedColor ?? '',
                    sizes: _selectedSizes ?? '',
                    quantity: _currentValue,
                  );
                  addToCartController.getAddToCart(cartModel);
                },
                child: const Text('Add To Cart'),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceWidget(ProductDetailsModel productDetailsModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productDetailsModel.product?.price ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$${productDetailsModel.product?.price ?? 0}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewSection(ProductDetailsModel productDetailsModel) {
    return Wrap(
      spacing: 17,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text(
              '${productDetailsModel.product?.star ?? 0}',
              style: const TextStyle(
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
        GetBuilder<AddToWishListController>(
          builder: (addToWishListController) {
            if (addToWishListController.inProgress) {
              return Transform.scale(
                scale: 0.4,
                child: const CircularProgressIndicator(),
              );
            }
            return WishButton(
              showAddToWishList: true,
              isSelected: true,
              onTap: () {
                addToWishListController.getAddToWishList(
                  widget.productId,
                );
              },
            );
          },
        )
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
