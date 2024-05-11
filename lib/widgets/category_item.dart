import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.desktop_windows_outlined,
            size: 48,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Electronics',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
            letterSpacing: 0.4,
          ),
        )
      ],
    );
  }
}
