import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:ecommerce_project/presentation/utils/assets_path.dart';
import 'package:ecommerce_project/widgets/app_bar_icon_button.dart';
import 'package:flutter/material.dart';
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
      body:  SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchTextField(),
            const SizedBox(height: 16,),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                viewportFraction: 1,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
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
            )
          ],
        ),
      )),
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

