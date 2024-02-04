import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/radio_button.dart';

class BusinessQuestionScreen extends StatefulWidget {
  const BusinessQuestionScreen({super.key});

  @override
  _BusinessQuestionScreenState createState() => _BusinessQuestionScreenState();
}

class _BusinessQuestionScreenState extends State<BusinessQuestionScreen> {
  int _selectedAnswer = -1; // -1 represents no answer selected
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: CustomAppBar(
        backImage: true, // Set the visibility of optional image
        logoutImage: false, // Set the visibility of far right image
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Do you have a\nsmall  business?',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  letterSpacing: 1.7,
                  color: Color(0xffffffff),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    isSelected: _selectedAnswer == 0,
                    onTap: () {
                      setState(() {
                        _selectedAnswer = _selectedAnswer == 0 ? -1 : 0;
                        if (_selectedAnswer == 0) {
                          // Navigate to home screen if 'Yes' is selected
                          Navigator.pushReplacementNamed(context, '/step0',arguments: args);
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    isSelected: _selectedAnswer == 1,
                    onTap: () {
                      setState(() {
                        _selectedAnswer = _selectedAnswer == 1 ? -1 : 1;
                        if (_selectedAnswer == 1) {
                          // Navigate to onboarding screen if 'No' is selected
                          Navigator.pushReplacementNamed(context, '/step0',
                          arguments: args);
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffffffff),
                    ))])
            ])))
    );
  }
}