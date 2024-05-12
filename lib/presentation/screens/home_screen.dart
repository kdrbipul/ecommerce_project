import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/presentation/utils/assets_path.dart';
import 'package:ecommerce_project/widgets/app_bar_icon_button.dart';
import 'package:ecommerce_project/widgets/category_item.dart';
import 'package:ecommerce_project/widgets/home_carousel_slider.dart';
import 'package:ecommerce_project/widgets/section_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            const HomeCarouselSlider(),
            const SizedBox(height: 16),
            SectionHeader(
              title: "All Category",
              onTapSeeAll: () {},
            ),
            const SizedBox(height: 16),
            _buildCategoryListView(),
            SectionHeader(
              title: "Popular Product",
              onTapSeeAll: () {},
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.white,
              child: SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      color: AppColors.primaryColor.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AssetsPath.productShoeSvg),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nike sports shoe 320k special edition',
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Wrap(
                            spacing: 17,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Text(
                                '\$30',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                              ),
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
                              Card(
                                color: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildCategoryListView() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 26);
        },
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

