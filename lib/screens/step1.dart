import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/Repository/Requests.dart';
import 'package:helloworld/cubit/seller_shop/add_seller_shop_cubit.dart';

import '../widgets/stepper.dart';
import '../widgets/appbar.dart';
import '../widgets/text_field.dart';
import '../widgets/main_button.dart';
import 'package:flutter/material.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  _Step1ScreenState createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  int currentStep = 0; // Current step in this screen

  TextEditingController shop_name = TextEditingController();
  TextEditingController shop_location = TextEditingController();
  TextEditingController facebook_link = TextEditingController();
  TextEditingController instagram_link = TextEditingController();
  TextEditingController website_link = TextEditingController();
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
              RichText(
                textAlign: TextAlign.start, // Align text within RichText center
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: 0.2,
                    color: Color(0xffffffff),
                    // You can set your desired text color here
                  ),
                  children: [
                    TextSpan(
                      text: "Let's start creating your ",
                    ),
                    TextSpan(
                      text: 'Shop',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Color(0xFF53B0A2), // 'SmallBizHub' text color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Add name and link to your shop',
                style: TextStyle(
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
              RichText(
                textAlign: TextAlign.start, // Align text within RichText center
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: 0.2,
                    color: Color(0xffffffff),
                    // You can set your desired text color here
                  ),
                  children: [
                    TextSpan(
                      text: "Name of your ",
                    ),
                    TextSpan(
                      text: 'Shop',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Color(0xFF53B0A2), // 'SmallBizHub' text color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              // Shop Name TextField
              CustomTextField(
                width: double.infinity,
                height: 40,
                borderRadius: 8,
                backgroundColor: Colors.grey[600]!,
                hintText: 'Shop\'s name*',
                isPassword: false, editingController: shop_name,
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.start, // Align text within RichText center
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: 0.2,
                    color: Color(0xffffffff),
                    // You can set your desired text color here
                  ),
                  children: [
                    TextSpan(
                      text: "Instagram link of your ",
                    ),
                    TextSpan(
                      text: 'Shop',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Color(0xFF53B0A2), // 'SmallBizHub' text color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),

              // Instagram Link TextField
              CustomTextField(
                width: double.infinity,
                height: 40,
                borderRadius: 8,
                backgroundColor: Colors.grey[600]!,
                hintText: 'Shop\'s Instagram link',
                isPassword: false, editingController: instagram_link,
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.start, // Align text within RichText center
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: 0.2,
                    color: Color(0xffffffff),
                    // You can set your desired text color here
                  ),
                  children: [
                    TextSpan(
                      text: "Facebook link of your ",
                    ),
                    TextSpan(
                      text: 'Shop',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Color(0xFF53B0A2), // 'SmallBizHub' text color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),

              // Facebook Link TextField
              CustomTextField(
                width: double.infinity,
                height: 40,
                borderRadius: 8,
                backgroundColor: Colors.grey[600]!,
                hintText: 'Shop\'s Facebook link',
                isPassword: false, editingController: facebook_link,
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.start, // Align text within RichText center
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: 0.2,
                    color: Color(0xffffffff),
                    // You can set your desired text color here
                  ),
                  children: [
                    TextSpan(
                      text: "Website link of your ",
                    ),
                    TextSpan(
                      text: 'Shop',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Color(0xFF53B0A2), // 'SmallBizHub' text color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),

              // Website Link TextField
              CustomTextField(
                width: double.infinity,
                height: 40,
                borderRadius: 8,
                backgroundColor: Colors.grey[600]!,
                hintText: 'Shop\'s Website link',
                isPassword: false, editingController: website_link,
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.start, // Align text within RichText center
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    letterSpacing: 0.2,
                    color: Color(0xffffffff),
                    // You can set your desired text color here
                  ),
                  children: [
                    TextSpan(
                      text: "Location of your ",
                    ),
                    TextSpan(
                      text: 'Shop',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: Color(0xFF53B0A2), // 'SmallBizHub' text color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),

              // Location TextField
              CustomTextField(
                width: double.infinity,
                height: 40,
                borderRadius: 8,
                backgroundColor: Colors.grey[600]!,
                hintText: 'Shop\'s Location',
                isPassword: false, editingController: shop_location,
              ),
              BlocConsumer<AddSellerShopCubit,AddSellerShopState>(
                  builder: (context,state){
                    if (state is AddSellerShopLoading){
                      return CircularProgressIndicator();
                    }
                    else if (state is AddSellerShopFailed){
                      return Text("failed");
                    }
                    return Container();
                  },
                  listener: (context,state) async{
                    if (state is AddSellerShopSuccess){
                     Response? shop_details = await Requests().SearchShop(search_query:seller_id.toString());
                      Navigator.pushReplacementNamed(context, '/step2',
                      arguments: [
                        seller_id,
                        shop_details?.data[0]['id']
                      ]);
                    }
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
        child: CustomMainButton(
          text: 'Save and Continue',
          onPressed: () {
            BlocProvider.of<AddSellerShopCubit>(context).AddSellerShopCheck(data: {
              "shop_name": shop_name.text.toString(),
              "facebook_link": facebook_link.text.toString(),
              "instagram_link": instagram_link.text.toString(),
              "website_link": website_link.text.toString(),
              "location": shop_location.text.toString(),
              "seller_id": seller_id
            });
            // Handle create account button press
          },
        ),
      ),
    );
  }
}
