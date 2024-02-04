import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import '../widgets/main_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController new_password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo and Reset Password text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/bird_logo.png',
                  width: 33,
                  height: 33,
                ),
                const SizedBox(width: 10),
                // Reset Password text
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    width: 285,
                    height: 34,
                    borderRadius: 30,
                    backgroundColor: Color(0xff6C6C6C),
                    hintText: 'New Password',
                    isPassword: true,
                    editingController: new_password,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    width: 285,
                    height: 34,
                    borderRadius: 30,
                    backgroundColor: Color(0xff6c6c6c),
                    hintText: 'Confirm Password',
                    isPassword: true,
                    editingController: confirm_password,
                  ),
                  const SizedBox(height: 50),
                  CustomMainButton(
                    text: 'Upload Password',
                    onPressed: () {
                      // Handle upload password button press
                      Navigator.pushReplacementNamed(context, '/signin');
                    },
                  ),
                  const SizedBox(height: 8), // Adjust the spacing as needed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle Sign Up tap
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(
                                0xFF53B0A2), // Color changed to 0xFF53B0A2
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Adjust the spacing as needed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle Sign Up tap
                          Navigator.pushReplacementNamed(context, '/signin');
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(
                                0xFF53B0A2), // Color changed to 0xFF53B0A2
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

