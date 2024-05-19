import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    super.key,
    required this.onChange,
    required this.sizes,
  });

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
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
            child: CircleAvatar(
              backgroundColor: widget.sizes[index],
              child: selectedIndex == index
                  ? const Icon(
                Icons.check,
                color: Colors.white,
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}