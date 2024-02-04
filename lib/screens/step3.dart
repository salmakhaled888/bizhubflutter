import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/business_type/business_type_cubit.dart';
import 'package:helloworld/cubit/shop_category/shop_category_cubit.dart';

import '../widgets/stepper.dart';
import '../widgets/appbar.dart';
import '../widgets/text_field.dart';
import '../widgets/main_button.dart';
import '../widgets/radio_button.dart';
import 'package:flutter/material.dart';

class Step3Screen extends StatefulWidget {
  const Step3Screen({super.key});

  @override
  _Step3ScreenState createState() => _Step3ScreenState();
}

class _Step3ScreenState extends State<Step3Screen> {
  int currentStep = 2; // Current step in this screen
  int _selectedAnswer = -1; // -1 represents no answer selected

  TextEditingController bsb_code = TextEditingController();
  TextEditingController account_number = TextEditingController();
  TextEditingController bank_name = TextEditingController();

  String business_type = "";
  @override
  Widget build(BuildContext context) {
    var seller_id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: const CustomAppBar(
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
                'Where should we pay your funds?',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Your information is protected',
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
                'For Tax purpose, what type of seller are you?',
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
                          business_type = "Individual";
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Individual',
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.normal,
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
                          business_type = "Business";
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Business',
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Is your account registered in ',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'business/trade name?',
                  style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.w200,
                    fontSize: 14,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              if (_selectedAnswer ==
                  1) // Display fields if Business is selected

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name of the account holder',
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Bank name*',
                        isPassword: false, editingController: bank_name,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'BSB code*',
                        isPassword: false, editingController: bsb_code,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Account number*',
                        isPassword: false, editingController: account_number,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              BlocConsumer<BusinessTypeCubit,BusinessTypeState>(
                  builder: (context,state){
                    if(state is ShopCategoryLoading){
                      return CircularProgressIndicator();
                    }
                    else if (state is ShopCategoryFailed){
                      return Text("Failed");
                    }
                    else{
                      return Container();
                    }
                  },
                  listener: (context,state){
                    Navigator.pushReplacementNamed(context, '/step4',
                        arguments: seller_id);
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
            BlocProvider.of<BusinessTypeCubit>(context).BusinessTypeCheck(data:{
              "business_type": business_type,
              "seller_id": seller_id
            });

            // Handle create account button press
          },
        ),
      ),
    );
  }
}
