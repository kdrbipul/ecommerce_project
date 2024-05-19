import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';

class WishButton extends StatefulWidget {
  const WishButton({super.key,  this.showAddToWishList = true});

  final bool showAddToWishList;

  @override
  State<WishButton> createState() => _WishButtonState();
}

class _WishButtonState extends State<WishButton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      replacement: _getIconButton(Icons.delete_rounded),
      child: _getIconButton(Icons.favorite_border_outlined),
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
}
