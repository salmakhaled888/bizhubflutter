import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioButton({
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF53B0A2),
            width: 2,
          ),
          color: isSelected ? const Color(0xFF53B0A2) : Colors.transparent,
        ),
        child: isSelected
            ? const Icon(
                Icons.radio_button_off_sharp,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
