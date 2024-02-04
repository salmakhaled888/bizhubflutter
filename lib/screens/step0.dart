import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/customer_signup/customer_sign_up_cubit.dart';
import 'package:helloworld/cubit/seller_signup/seller_sign_up_cubit.dart';
import 'package:intl/intl.dart';
import '../Repository/Requests.dart';
import '../widgets/appbar.dart';
import '../widgets/main_button.dart';
import '../widgets/text_field.dart';
import '../widgets/radio_button.dart';

class Step0Screen extends StatefulWidget {
  const Step0Screen({Key? key}) : super(key: key);

  @override
  _Step0ScreenState createState() => _Step0ScreenState();
}

class _Step0ScreenState extends State<Step0Screen> {
  int _userType = -1; // -1 represents no user type selected

  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone_number = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController national_id = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postal_code = TextEditingController();
  TextEditingController country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: const CustomAppBar(
        backImage: true, // Set the visibility of optional image
        logoutImage: false, // Set the visibility of far-right image
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Introduce Yourself',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Tell us a bit about yourself as a seller or customer',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // User Type Radio Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomRadioButton(
                    isSelected: _userType == 0,
                    onTap: () {
                      setState(() {
                        _userType = _userType == 0 ? -1 : 0;
                        if (_userType == 0) {
                          // save to api
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Customer',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomRadioButton(
                      isSelected: _userType == 1,
                      onTap: () {
                        setState(() {
                          _userType = _userType == 1 ? -1 : 1;
                          if (_userType == 1) {
                            // save to api
                          }
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Seller',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),

              if (_userType == 0) // Display fields for Customer
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'First Name*',
                        isPassword: false,
                        editingController: first_name,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Last Name*',
                        isPassword: false,
                        editingController: last_name,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Phone Number*',
                        isPassword: false,
                        editingController: phone_number,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Address 1*',
                        isPassword: false,
                        editingController: address1,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Address 2*',
                        isPassword: false,
                        editingController: address2,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: ' City*',
                        isPassword: false,
                        editingController: city,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: ' Postal Code*',
                        isPassword: false,
                        editingController: postal_code,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Country*',
                        isPassword: false,
                        editingController: country,
                      ),
                      BlocConsumer<CustomerSignUpCubit,CustomerSignUpState>(
                          builder: (context,state){
                            if (state is CustomerSignUpLoading){
                              return CircularProgressIndicator();
                            }
                            else if (state is CustomerSignUpFailed){
                              return Text(state.response!.statusMessage.toString());
                            }
                            return Container();
                          },
                          listener: (context,state) async{
                            if (state is CustomerSignUpSuccess){
                              Response customer_id = await Requests().SearchCustomer(search_query:args) as Response;
                              Navigator.pushReplacementNamed(context, '/home',
                              arguments: [
                                customer_id.data[0]['first_name'],
                                customer_id.data[0]['address_line1']
                              ]);

                            }
                          })
                    ],
                  ),
                ),
              if (_userType == 1) // Display fields for Seller
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'First Name*',
                        isPassword: false,
                        editingController: first_name,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Last Name*',
                        isPassword: false,
                        editingController: last_name,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'National ID*',
                        isPassword: false,
                        editingController: national_id,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Phone Number*',
                        isPassword: false,
                        editingController: phone_number,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Address 1*',
                        isPassword: false,
                        editingController: address1,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Address 2*',
                        isPassword: false,
                        editingController: address2,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: ' City*',
                        isPassword: false,
                        editingController: city,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        width: double.infinity,
                        height: 40,
                        borderRadius: 8,
                        backgroundColor: Colors.grey[600]!,
                        hintText: 'Country*',
                        isPassword: false,
                        editingController: country,
                      ),
                      BlocConsumer<SellerSignUpCubit,SellerSignUpState>(
                          builder: (context,state){
                            if (state is SellerSignUpLoading){
                              return CircularProgressIndicator();
                            }
                            else if (state is SellerSignUpFailed){
                              return Text(state.response!.statusMessage.toString());
                            }
                            return Container();
                          },
                          listener: (context,state) async{
                            if (state is SellerSignUpSuccess){
                              Response seller_id = await Requests().SearchSeller(search_query:args) as Response;
                              Navigator.pushReplacementNamed(context, '/step1',
                              arguments: seller_id.data[0]['id']);

                            }
                          })
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
          text: 'Next',
          onPressed: () {
            if (_userType == 0) {
              // User is a customer
              // Validate and save customer information

              // For now, just navigate to the home screen
              DateTime now = DateTime.now();
              String formattedDate = DateFormat('yyyy-MM-dd').format(now.toLocal());
              BlocProvider.of<CustomerSignUpCubit>(context).CustomerRegisterCheck(data: {
                "first_name":first_name.text.toString() ,
                "last_name": last_name.text.toString(),
                "telephone": int.parse(phone_number.text.toString()),
                "address_line1": address1.text.toString(),
                "address_line2": address2.text.toString(),
                "city": city.text.toString(),
                "postal_code": postal_code.text.toString(),
                "country": country.text.toString(),
                "created_at": formattedDate.toString(),
                "user_id": args
              });

            } else if (_userType == 1) {
              // User is a seller
              // Validate and save seller information

              // Navigate to Step1 screen

              DateTime now = DateTime.now();
              String formattedDate = DateFormat('yyyy-MM-dd').format(now.toLocal());
              BlocProvider.of<SellerSignUpCubit>(context).SellerRegisterCheck(data: {
                "national_id": national_id.text.toString(),
                "first_name":first_name.text.toString() ,
                "last_name": last_name.text.toString(),
                "telephone": int.parse(phone_number.text.toString()),
                "address_line1": address1.text.toString(),
                "address_line2": address2.text.toString(),
                "city": city.text.toString(),
                "postal_code": postal_code.text.toString(),
                "country": country.text.toString(),
                "created_at": formattedDate.toString(),
                "user_id": args
              });
            }
          },
        ),
      ),
    );
  }
}
