import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool backImage;
  final bool logoutImage;

  const CustomAppBar({
    Key? key,
    this.backImage = false,
    this.logoutImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF383838),
      elevation: 0, // Remove the dividing line
      // Custom layout for app bar actions
      leadingWidth: 80.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                // onTap: () {},
                child: SizedBox(
                  width: 33,
                  height: 33,
                  child: Image.asset(
                    'assets/images/bird_logo.png', // Replace with your logo image path
                  ),
                ),
              ), // Display logo by default
            ), // Expanded widget closing parenthesis was missing here

            if (backImage)
              GestureDetector(
                onTap: () {
                  // Implement navigation logic for the optional image tap
                  Navigator.pop(context);
                },
                child: SizedBox(
                  width: 33,
                  height: 33,
                  child: Image.asset(
                    'assets/images/back.png', // Replace with your optional image path
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          children: <Widget>[
            if (logoutImage)
              GestureDetector(
                onTap: () {
                  // Implement navigation logic for the far right image tap
                  Navigator.pushReplacementNamed(context, '/onboarding');
                },
                child: SizedBox(
                  width: 33,
                  height: 33,
                  child: Image.asset(
                    'assets/images/logout.png', // Replace with your far right image path
                  ),
                ),
              ), // Display far right image if enabled
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
