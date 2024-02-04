import 'package:flutter/material.dart';

import '../widgets/main_button.dart';

class ContinueAsScreen extends StatelessWidget {
  const ContinueAsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Continue as a Guest button
            CustomMainButton(
              text: 'Continue as a Guest',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            const SizedBox(height: 20),
            // Sign In button
            CustomMainButton(
              text: 'Sign In',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signin');
              },
            ),
            const SizedBox(height: 20),
            // Sign Up button
            CustomMainButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
