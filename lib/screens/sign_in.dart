import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/Repository/Requests.dart';
import 'package:helloworld/cubit/sign_in/signin_cubit.dart';
import '../widgets/text_field.dart';
import '../widgets/main_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo and Sign In text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/bird_logo.png',
                  width: 33,
                  height: 33,
                ),
                const SizedBox(width: 10),
                // Sign In text
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  CustomTextField(
                    width: 285,
                    height: 34,
                    borderRadius: 30,
                    backgroundColor: Color(0xff6C6C6C),
                    hintText: 'Email',
                    editingController: email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    width: 285,
                    height: 34,
                    borderRadius: 30,
                    backgroundColor: Color(0xff6c6c6c),
                    hintText: 'Password',
                    isPassword: true,
                    editingController: password,
                  ),
                  const SizedBox(height: 50),
                  CustomMainButton(
                    text: 'Sign In',
                    onPressed: () {
                      BlocProvider.of<SigninCubit>(context).LoginAuthentication(data: {
                        "email": email.text.toString(),
                        "password": password.text.toString()
                      });
                      // Handle sign-in button press
                    },
                  ),
                  const SizedBox(height: 8), // Adjust the spacing as needed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                          // Handle Sign Up tap
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(
                                0xFF53B0A2), // Color changed to 0xFF53B0A2
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Adjust the spacing as needed
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/resetPass');

                      // Handle Forget Password tap
                    },
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer<SigninCubit,SigninState>(
                builder: (context,state){
                  if(state is SigninLoaded){
                    return CircularProgressIndicator();
                  }
                  else if(state is SigninFailure){
                    return Text("Failed");
                  }
                  else{
                    return Container();
                  }
                },
                listener: (context,state) async{
                  if(state is SigninSuccess){
                    Response user_details = await Requests().SearchUser(search_query: email.text.toString()) as Response;
                    print("User details: $user_details");
                    if(user_details.statusCode == 200 || user_details.statusCode == 201){
                      var user_id = user_details.data[0]['id'];
                      print("user id: $user_id");
                      Response is_customer_details = await Requests().SearchIsCustomer(search_query: user_id) as Response;
                      print("is customer details: $is_customer_details");
                      if(is_customer_details.statusCode == 200 || is_customer_details.statusCode == 201) {
                        bool is_customer = is_customer_details.data[0]['is_customer'];
                        print("is customer: $is_customer");
                        if(is_customer == true){
                          Response customer_details = await Requests().SearchCustomer(search_query: "?user_id=$user_id") as Response;
                          print("customer details: $customer_details");
                          Navigator.pushReplacementNamed(context, '/home',
                              arguments: [
                                customer_details?.data[0]['id'],
                                customer_details?.data[0]['first_name'],
                                customer_details?.data[0]['address_line1'],
                                user_id
                              ]);
                        }
                        else{
                          Response seller_details = await Requests().SearchSeller(search_query: "?user_id=$user_id") as Response;
                          print("seller details: $seller_details");
                          Navigator.pushReplacementNamed(context, '/sellerHome',
                              arguments: [
                                seller_details?.data[0]['id'],
                                seller_details?.data[0]['first_name'],
                                seller_details?.data[0]['address_line1'],
                                user_id
                              ]);
                        }
                      }
                    }
                  }
                })

          ],
        ),
      ),
    );
  }
}
