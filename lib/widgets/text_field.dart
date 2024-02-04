import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final String hintText;
  final bool isPassword;
  TextEditingController editingController;

   CustomTextField({
    Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.backgroundColor,
    required this.hintText,
    this.isPassword = false, required this.editingController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: TextField(
          controller: editingController,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white, height: 0),
          ),
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
