import 'dart:async';
import 'package:flutter/material.dart';
// Replace with your home screen file

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds and then navigate to the home screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/pic.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        // You can customize the UI of the splash screen here
        child: const Center(
          // You can add a logo or additional UI elements if needed
          child:
              CircularProgressIndicator(), // For example, show a loading indicator
        ),
      ),
    );
  }
}
