import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/shop_category/shop_category_cubit.dart';
import 'package:helloworld/widgets/text_field.dart';

import '../widgets/stepper.dart';
import '../widgets/appbar.dart';
import '../widgets/grey_button.dart';
import '../widgets/main_button.dart';
import 'package:flutter/material.dart';

class Step2Screen extends StatefulWidget {
  const Step2Screen({super.key});

  @override
  _Step2ScreenState createState() => _Step2ScreenState();
}

class _Step2ScreenState extends State<Step2Screen> {
  TextEditingController others = TextEditingController();
  int currentStep = 1; // Current step in this screen
  String category = "";
  Widget display_widget = Container();
  bool others_click = false;
  @override
  Widget build(BuildContext context) {
    List data = [ModalRoute.of(context)!.settings.arguments];
    return Scaffold(
      appBar: const CustomAppBar(
        backImage: true, // Set the visibility of optional image
        logoutImage: false, // Set the visibility of far right image
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What do you sell?',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Help customers understand what you offer',
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
              //const SizedBox(height: 10),
              const Text(
                'Choose your Category',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GreyButton(
                    text: 'Electronics',
                    onPressed: () {
                      if(category == ""){
                        category += 'Electronics';
                      }
                      else{
                        category += ', Electronics';
                      }
                      setState(() {

                      });
                    },
                    width: 110, // Adjust width as needed
                  ),
                  GreyButton(
                    text: 'Mobiles',
                    onPressed: () {
                      if(category == ""){
                        category += 'Mobiles';
                      }
                      else{
                        category += ', Mobiles';
                      }
                      setState(() {

                      });
                    },
                    width: 85,
                  ),
                  GreyButton(
                    text: 'Eyewear',
                    onPressed: () {
                      if(category == ""){
                        category += 'Eyewear';
                      }
                      else{
                        category += ', Eyewear';
                      }
                      setState(() {

                      });
                    },
                    width: 85,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GreyButton(
                    text: 'Clothing & Shoes',
                    onPressed: () {
                      if(category == ""){
                        category += 'Clothing & Shoes';
                      }
                      else{
                        category += ', Clothing & Shoes';
                      }
                      setState(() {

                      });
                    },
                    width: 160, // Adjust width as needed
                  ),
                  GreyButton(
                    text: 'Home & Living',
                    onPressed: () {
                      if(category == ""){
                        category += 'Home & Living';
                      }
                      else{
                        category += ', Home & Living';
                      }
                      setState(() {

                      });
                      print(category);
                    },
                    width: 130,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GreyButton(
                    text: 'Jewellery & Accessories',
                    onPressed: () {
                      if(category == ""){
                        category += 'Jewellery & Accessories';
                      }
                      else{
                        category += ', Jewellery & Accessories';
                      }
                      setState(() {

                      });
                    },
                    width: 185, // Adjust width as needed
                  ),
                  GreyButton(
                    text: 'Entertainment',
                    onPressed: () {
                      if(category == ""){
                        category += 'Entertainment';
                      }
                      else{
                        category += ', Entertainment';
                      }
                      setState(() {

                      });
                    },
                    width: 105,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GreyButton(
                    text: 'Sports',
                    onPressed: () {
                      if(category == ""){
                        category += 'Sports';
                      }
                      else{
                        category += ', Sports';
                      }
                      setState(() {

                      });
                    },
                    width: 70, // Adjust width as needed
                  ),
                  GreyButton(
                    text: 'Arts & Collectibles',
                    onPressed: () {
                      if(category == ""){
                        category += 'Arts & Collectibles';
                      }
                      else{
                        category += ', Arts & Collectibles';
                      }
                      setState(() {

                      });
                    },
                    width: 150,
                  ),
                  GreyButton(
                    text: 'Others',
                    onPressed: () {
                      others_click = !others_click;
                      print(others_click);

                      setState(() {
                        if(others_click == true){
                          display_widget =  CustomTextField(
                            width: double.infinity,
                            height: 40,
                            borderRadius: 8,
                            backgroundColor: Colors.grey[600]!,
                            hintText: 'Others',
                            isPassword: false,
                            editingController: others,
                          );
                          if(category == ""){
                            category += others.text.toString();
                          }
                          else{
                            category += ', ${others.text.toString()}';
                          }
                        }
                        else{
                          display_widget = Container();
                        }

                      });
                    },
                    width: 70,
                  ),
                ],
              ),
              display_widget,
              BlocConsumer<ShopCategoryCubit,ShopCategoryState>(
                  builder: (context,state){
                    if(state is ShopCategoryLoading){
                      return CircularProgressIndicator();
                    }
                    else if(state is ShopCategoryFailed){
                      return Text("Failed");
                    }
                    else{
                      return Container();
                    }
                  },
                  listener: (context,state){
                    if(state is ShopCategorySuccess){
                      Navigator.pushReplacementNamed(context, '/step3',
                      arguments: data[0][0]);
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
            BlocProvider.of<ShopCategoryCubit>(context).ShopCategoryCheck(data: {
            "category_name": category.toString(),
            "seller_id": data[0][0],
            "shop_id": data[0][1]
            });

            // Handle create account button press
          },
        ),
      ),
    );
  }
}
