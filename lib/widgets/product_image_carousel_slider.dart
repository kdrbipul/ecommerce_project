import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key,
  });

  @override
  State<ProductImageCarouselSlider> createState() =>
      _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState
    extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildCarouselSlider(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 8,
              child: _buildDotIndicator(),
            )
          ],
        ),
      ],
    );
  }



  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220,
        viewportFraction: 1,
        onPageChanged: (index, _) {
          _selectedPageIndex.value = index;
        },
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
              child: Text(
                'text $i',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
        valueListenable: _selectedPageIndex,
        builder: (context, currentPage, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  height: 15,
                  width: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: i == currentPage ? AppColors.primaryColor : Colors.white,
                    border: Border.all(
                      color: i == currentPage
                          ? AppColors.primaryColor
                          : Colors.white,
                      width: 1.25,
                    ),
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
