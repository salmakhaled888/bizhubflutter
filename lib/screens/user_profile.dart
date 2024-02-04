import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/appbar.dart';
import 'dart:io';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  @override
  Widget build(BuildContext context) {
    List data = [ModalRoute.of(context)!.settings.arguments];
    return Scaffold(
      appBar: const CustomAppBar(
        backImage: true, // Set to true if you want the back image
        logoutImage: false, // Set to true if you want the logout image
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 58.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'User Profile',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Profile Picture
              GestureDetector(
                onTap: () {
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xff5E5E5E),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.tealAccent[700],
                  )
                ),
              ),

              const SizedBox(height: 20),
              // User Information
              _buildUserInfo("First name", data[0][0].toString()),
              const SizedBox(height: 10),
              _buildUserInfo("Last name", data[0][1].toString()),
              const SizedBox(height: 10),
              _buildUserInfo("Phone number", data[0][2].toString()),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigate to Location Screen
                  Navigator.pushNamed(context, '/cart');
                },
                child: _buildUserInfo("My Cart","" ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigate to Location Screen
                  Navigator.pushNamed(context, '/favourite');
                },
                child: _buildUserInfo("Favourite","" ),
              ),
              /*GestureDetector(
                onTap: () {
                  // Navigate to Location Screen
                  Navigator.pushNamed(context, '/location');
                },
                child: _buildUserInfo("Location", location),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xff6C6C6C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }


}
