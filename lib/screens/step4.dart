import '../widgets/stepper.dart';
import '../widgets/appbar.dart';
import '../widgets/text_field.dart';
import '../widgets/main_button.dart';
import '../widgets/radio_button.dart';
import 'package:flutter/material.dart';

class Step4Screen extends StatefulWidget {
  const Step4Screen({super.key});

  @override
  _Step4ScreenState createState() => _Step4ScreenState();
}

class _Step4ScreenState extends State<Step4Screen> {
  int currentStep = 3; // Current step in this screen
  int _selectedAnswer = -1; // -1 represents no answer selected
  TextEditingController free_delivery_min_amount = TextEditingController();
  TextEditingController charges = TextEditingController();
  TextEditingController charges_orders = TextEditingController();
  TextEditingController charges_km = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var seller_id = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: CustomAppBar(
        backImage: true, // Set the visibility of optional image
        logoutImage: false, // Set the visibility of far right image
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Set your delivery charges',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'There are no upfront costs for selling here',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              MyCustomStepper(
                activeStep: currentStep, // Pass the current step to the stepper
                currentScreenStep:
                    currentStep, // Pass the current step in the screen
              ),
              const SizedBox(height: 2),
              const Text(
                'For Tax purpose, how much delivery charges?',
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    isSelected: _selectedAnswer == 0,
                    onTap: () {
                      setState(() {
                        _selectedAnswer = _selectedAnswer == 0 ? -1 : 0;
                        if (_selectedAnswer == 0) {
                          // save to api
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Free delivery on all orders',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
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
                          // save to api
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Free delivery above a certain bill amount ',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
              if (_selectedAnswer ==
                  1) // Display fields if Business is selected
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Min amount for free delivery*',
                        isPassword: false, editingController: free_delivery_min_amount,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Charges below min amount*',
                        isPassword: false, editingController: charges,
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    isSelected: _selectedAnswer == 2,
                    onTap: () {
                      setState(() {
                        _selectedAnswer = _selectedAnswer == 2 ? -1 : 2;
                        if (_selectedAnswer == 2) {
                          // save to api
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Fixed delivery charge for all orders ',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
              if (_selectedAnswer ==
                  2) // Display fields if Business is selected
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Charges for all orders*',
                        isPassword: false, editingController: charges_orders,
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    isSelected: _selectedAnswer == 3,
                    onTap: () {
                      setState(() {
                        _selectedAnswer = _selectedAnswer == 3 ? -1 : 3;
                        if (_selectedAnswer == 3) {
                          // save to api
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Delivery charge per Kilometer  ',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
              if (_selectedAnswer ==
                  3) // Display fields if Business is selected
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Charges per Kilometer*',
                        isPassword: false, editingController: charges_km,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
        child: CustomMainButton(
          text: 'Save and Continue',
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/step5',
            arguments: seller_id);
            // Handle create account button press
          },
        ),
      ),
    );
  }
}
