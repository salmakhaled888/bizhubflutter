import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/main_button.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backImage: true,
        logoutImage: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Payment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Payment Method:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            // Payment Options (Add more if needed)
            _buildPaymentOption('Cash', Icons.attach_money),
            // Add more payment options as needed
            const SizedBox(height: 16),
            // Confirm Payment Button
            CustomMainButton(
              text: 'Confirm Payment',
              onPressed: () {
                // Implement your logic for confirming the payment
                // This is where you would typically interact with a payment gateway
                // or update your backend to mark the order as paid.
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Payment Successful'),
                      content: const Text('Thank you for your purchase!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // You might want to navigate to the home screen or another screen after successful payment
                            // Navigator.pushReplacementNamed(context, '/home');
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String optionName, IconData iconData) {
    return ListTile(
      onTap: () {
        // Handle the selection of the payment option
        // You can add specific logic for each payment method here
      },
      leading: Icon(
        iconData,
        color: Colors.white,
      ),
      title: Text(
        optionName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
