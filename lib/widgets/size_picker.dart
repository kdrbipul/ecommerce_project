import 'package:ecommerce_project/presentation/utils/app_color.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.onChange,
    required this.sizes,
    this.isRounded = true,
  });

  final List<String> sizes;
  final Function(String) onChange;
  final bool isRounded;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.sizes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              widget.onChange(widget.sizes[index]);
              setState(() {});
            },
            child: Container(
              height: 35,
              width: widget.isRounded ? 35 : null,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: _getSelectedBgColor(index == selectedIndex),
                borderRadius: BorderRadius.circular(widget.isRounded ? 100 : 8),
                border: Border.all(
                  color: _getSelectedTextColor(index == selectedIndex),
                )
              ),

              child: FittedBox(
                child: Text(
                  widget.sizes[index],
                  style: TextStyle(
                      color: _getSelectedTextColor(index == selectedIndex,
                      ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  Color _getSelectedTextColor(bool isSelected) {
    return isSelected ? Colors.white : Colors.black;
  }
  Color _getSelectedBgColor(bool isSelected) {
    return isSelected ? AppColors.primaryColor : Colors.transparent;
  }
}