import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/text_field.dart';
import '../widgets/main_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        backImage: true, // Set the visibility of optional image
        logoutImage: false, // Set the visibility of far right image
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Search Rounded TextField
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
            CustomTextField(
              width: double.infinity,
              height: 40,
              borderRadius: 20,
              backgroundColor: Colors.grey[600]!,
              hintText: 'Search for your location',
              isPassword: false,
              editingController: location,
            ),
          ),
          // Map Placeholder (Replace with your actual map widget)
          Container(
            height: 200,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Text(
              'Map Placeholder',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Tell us your location text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tell us your location',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'This helps us gather your address information to connect you with nearby commercial places through SmallBizHub, enabling convenient access to local businesses in your area.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // Continue Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomMainButton(
              text: 'Continue',
              onPressed: () {
                // Handle continue button press
              },
            ),
          ),
        ],
      ),
    );
  }
}

