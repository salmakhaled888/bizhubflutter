import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 90,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffffffff),
          border: Border.all(
            color: const Color(0xFF53B0A2), // Border color
            width: 3, // Stroke width
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF53B0A2), // Text color same as border color
            ),
          ),
        ),
      ),
    );
  }
}
