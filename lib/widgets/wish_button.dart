import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';

class WishButton extends StatelessWidget {
  const WishButton({
    super.key,
    this.showAddToWishList = true,
    this.isSelected = false,
    required this.onTap,
  });
  final bool showAddToWishList;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      replacement: _getIconButton(Icons.delete_rounded),
      child: InkWell(
        onTap: onTap,
        child: _getIconButton(
          _getIconData(),
        ),
      ),
    );
  }

  Widget _getIconButton(IconData icon) {
    return Card(
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }

  IconData _getIconData() {
    return isSelected ? Icons.favorite : Icons.favorite_outline_rounded;
  }
}
