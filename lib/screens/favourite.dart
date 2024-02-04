import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/main_button.dart'; // Import your custom button widget

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  // Map to store the quantity for each product
  final Map<String, int> productQuantity = {
    'Product 1': 0,
    'Product 2': 0,
    'Product 3': 0,
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
              'Favourites',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // List of favourite products
            Expanded(
              child: ListView(
                children: [
                  _buildFavouriteItem(
                    'assets/images/1.jpg',
                    'Product 1',
                    '500',
                    productQuantity['Product 1']!,
                  ),
                  _buildFavouriteItem(
                    'assets/images/2.jpg',
                    'Product 2',
                    '456',
                    productQuantity['Product 2']!,
                  ),
                  _buildFavouriteItem(
                    'assets/images/3.jpg',
                    'Product 3',
                    '900',
                    productQuantity['Product 3']!,
                  ),
                  // Add more favourite items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavouriteItem(
      String imagePath, String productName, String productPrice, int quantity) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      //padding: const EdgeInsets.all(10),
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
                      if (quantity > 0) {
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
          // Add to Cart Button
          IconButton(
            onPressed: () {
              // Add the product to the cart
              // Implement your logic to handle adding to the cart
              // You can use a global state management solution or a callback to notify the parent widget.
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
