import 'package:flutter/material.dart';

class GreyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;

  const GreyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff5E5E5E),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}
