import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomMainButton({
    Key? key, // Change super.key to Key? key
    required this.text,
    required this.onPressed,
  }) : super(
            key:
                key); // Use super(key: key) to pass the key to the superclass constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 285,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFF53B0A2),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
