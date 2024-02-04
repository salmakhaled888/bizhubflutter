import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/stepper.dart';
import '../widgets/appbar.dart';
import '../widgets/main_button.dart';
import '../widgets/text_field.dart';

class Step5Screen extends StatefulWidget {
  const Step5Screen({Key? key}) : super(key: key);

  @override
  _Step5ScreenState createState() => _Step5ScreenState();
}

class _Step5ScreenState extends State<Step5Screen> {
  int currentStep = 4; // Current step in this screen
  List<File?> images = List.generate(5, (_) => null);
  PageController _pageController = PageController(initialPage: 0);

  Future<void> _getImage(ImageSource source, int imageNumber) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        images[imageNumber - 1] = File(pickedFile.path);
      }
    });
  }

  TextEditingController product_name = TextEditingController();
  TextEditingController product_description = TextEditingController();
  TextEditingController product_price= TextEditingController();

  @override
  Widget build(BuildContext context) {
    var seller_id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: const CustomAppBar(
        backImage: true, // Set the visibility of the optional image
        logoutImage: false, // Set the visibility of the far-right image
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add your items to start selling',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Add at least one listing in order to launch your shop',
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
              const Text(
                'Photos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Add as many as you can, so buyers can see ever detail',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 150, // Adjust the height as needed
                width: double.maxFinite,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return _buildImageContainer(images[index], index + 1);
                  },
                ),
              ),
              const Text(
                'Videos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Bring your product to life with a 5 to 15 second video - It could help you drive more sales',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 150, // Adjust the height as needed
                width: double.maxFinite,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return _buildImageContainer(images[index], index + 1);
                  },
                ),
              ),
              const Text(
                'Barcode',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Add the barcode of your product',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 150, // Adjust the height as needed
                width: double.maxFinite,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return _buildImageContainer(images[index], index + 1);
                  },
                ),
              ),
              const Text(
                'Listing details',
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                width: double.maxFinite,
                height: 40,
                borderRadius: 8,
                backgroundColor: Colors.grey[600]!,
                hintText: 'Product name*',
                isPassword: false, editingController: product_name,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                width: double.maxFinite,
                height: 100,
                borderRadius: 8,
                backgroundColor: Colors.grey[600]!,
                hintText: 'Description*',
                isPassword: false, editingController: product_description,
              ),
              const SizedBox(height: 5),
              const Text(
                'Price',
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                width: double.maxFinite,
                height: 40,
                borderRadius: 8,
                backgroundColor: Colors.grey[600]!,
                hintText: 'Product price*',
                isPassword: false, editingController: product_price,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
        child: CustomMainButton(
          text: 'Save',
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/sellerHome');
            // Handle create account button press
          },
        ),
      ),
    );
  }

  Widget _buildImageContainer(File? image, int imageNumber) {
    return InkWell(
      onTap: () {
        _showImagePickerDialog(imageNumber);
      },
      child: Container(
        width: 120,
        height: 120,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(10),
        ),
        child: image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  image,
                  fit: BoxFit.cover,
                ),
              )
            : Center(
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[600],
                  child: const Icon(
                    Icons.add_circle,
                    color: Color(0xFF53B0A2),
                  ),
                ),
              ),
      ),
    );
  }

  void _showImagePickerDialog(int imageNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          actions: [
            TextButton(
              onPressed: () {
                _getImage(ImageSource.gallery, imageNumber);
                Navigator.of(context).pop();
              },
              child: const Text("Gallery"),
            ),
            TextButton(
              onPressed: () {
                _getImage(ImageSource.camera, imageNumber);
                Navigator.of(context).pop();
              },
              child: const Text("Camera"),
            ),
          ],
        );
      },
    );
  }
}
