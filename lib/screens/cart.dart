import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomMainButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 285,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFF53B0A2),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Map to store the quantity for each product
  final Map<String, int> productQuantity = {
    'Product 1': 1,
    'Product 2': 1,
    'Product 3': 1,
    // Add more products as needed
  };

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shopping Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // List of products in the cart
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem(
                    'assets/images/1.jpg',
                    'Product 1',
                    '500',
                    productQuantity['Product 1']!,
                  ),
                  _buildCartItem(
                    'assets/images/2.jpg',
                    'Product 2',
                    '456',
                    productQuantity['Product 2']!,
                  ),
                  _buildCartItem(
                    'assets/images/3.jpg',
                    'Product 3',
                    '900',
                    productQuantity['Product 3']!,
                  ),
                  // Add more cart items as needed
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Total amount placeholder (to be replaced with API data)
            Center(
              child: Text(
                'Total Amount: ${calculateTotalAmount()} EGP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Checkout Button
            Center(
              child: CustomMainButton(
                text: 'Check out',
                onPressed: () {
                  Navigator.pushNamed(context, '/payment');
                  // Replace '/payment' with your actual route for the payment screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(
      String imagePath, String productName, String productPrice, int quantity) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$productPrice EGP',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Amount Section
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    // Decrease quantity
                    setState(() {
                      if (quantity > 1) {
                        productQuantity[productName] = quantity - 1;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Increase quantity
                    setState(() {
                      productQuantity[productName] = quantity + 1;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to calculate the total amount
  int calculateTotalAmount() {
    int totalAmount = 0;
    for (var entry in productQuantity.entries) {
      totalAmount += int.parse(entry.value.toString()) *
          int.parse(entry.key.split(' ')[1]);
    }
    return totalAmount;
  }
}
