import 'package:ecommerce_project/data/models/category.dart';
import 'package:ecommerce_project/data/models/product.dart';
import 'package:ecommerce_project/presentation/state_holders/category_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/new_product_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/popular_product_list_controller.dart';
import 'package:ecommerce_project/presentation/state_holders/special_product_list_controller.dart';
import 'package:ecommerce_project/presentation/utils/assets_path.dart';
import 'package:ecommerce_project/widgets/app_bar_icon_button.dart';
import 'package:ecommerce_project/widgets/category_item.dart';
import 'package:ecommerce_project/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_project/widgets/home_carousel_slider.dart';
import 'package:ecommerce_project/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchTextField(),
            const SizedBox(height: 16),
            GetBuilder<HomeSliderController>(builder: (sliderController) {
              if (sliderController.inProgress) {
                return const SizedBox(
                  height: 220,
                  child: CenteredCircularProgressIndicator(),
                );
              }
              return HomeCarouselSlider(
                sliderList: sliderController.sliderList,
              );
            }),
            const SizedBox(height: 16),
            SectionHeader(
              title: "All Category",
              onTapSeeAll: () {
                Get.find<MainBottomNavBarController>().selectCategory();
              },
            ),
            const SizedBox(height: 16),
            GetBuilder<CategoryListController>(
                builder: (categoryListController) {
              if (categoryListController.inProgress) {
                return const SizedBox(
                  height: 120,
                  child: CenteredCircularProgressIndicator(),
                );
              }
              return _buildCategoryListView(
                  categoryListController.categoryList);
            }),
            SectionHeader(
              title: "Popular Product",
              onTapSeeAll: () {},
            ),
            GetBuilder<PopularProductListController>(
                builder: (popularProductListController) {
              if (popularProductListController.popularProductInProgress) {
                return const SizedBox(
                  height: 225,
                  child: CenteredCircularProgressIndicator(),
                );
              }
              return _buildProductListView(popularProductListController.productList);
            }),
            const SizedBox(height: 8),
            SectionHeader(
              title: "Special",
              onTapSeeAll: () {},
            ),
            GetBuilder<SpecialProductListController>(
              builder: (specialProductListController) {
                if(specialProductListController.inProgress){
                return const SizedBox(
                    height: 225, child: CenteredCircularProgressIndicator(),
                );
              }
                return _buildProductListView(specialProductListController.productList);
              }
            ),
            const SizedBox(height: 8),
            SectionHeader(
              title: "New",
              onTapSeeAll: () {},
            ),
            GetBuilder<NewProductListController>(
              builder: (newProductListController) {
                if(newProductListController.inProgress){
                return const SizedBox(
                    height: 225, child: CenteredCircularProgressIndicator(),
                );
              }
                return _buildProductListView(newProductListController.productList);
              }
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildProductListView(List<Product> productList) {
   /* return SizedBox(
      height: 225,
      child: ListView.separated(
        itemCount: productList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  ProductCard(product: productList[index],);
          // return const ProductCard();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8);
        },
      ),
    );*/
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
          productList.map((e) => ProductCard(product: e)).toList(),

      ),
    );
  }


  Widget _buildCategoryListView(List<Category> categoryList) {
    /*return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            category: categoryList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 26);
        },
      ),
    );*/
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryList.map((e) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CategoryItem(category: e),
            const SizedBox(width: 9),
          ],
        )).toList(),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          // color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}
