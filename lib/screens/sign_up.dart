import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/Repository/Requests.dart';
import 'package:helloworld/cubit/signup/signup_cubit.dart';
import '../widgets/text_field.dart';
import '../widgets/main_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email_field= TextEditingController();
  TextEditingController password_field= TextEditingController();
  TextEditingController confirm_password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo and Sign Up text
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
                // Sign Up text
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            const Text(
              'Enter your details to start using the app',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
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
                    editingController: email_field,
                  ),

                  const SizedBox(height: 20),
                  CustomTextField(
                    width: 285,
                    height: 34,
                    borderRadius: 30,
                    backgroundColor: Color(0xff6c6c6c),
                    hintText: 'Password',
                    isPassword: true,
                    editingController: password_field,
                  ),
                  const SizedBox(height: 20),
                   CustomTextField(
                    width: 285,
                    height: 34,
                    borderRadius: 30,
                    backgroundColor: Color(0xff6c6c6c),
                    hintText: 'Confirm Password',
                    isPassword: true,
                     editingController: confirm_password,
                  ),
                  const SizedBox(height: 30),
                  CustomMainButton(
                    text: 'Create Account',
                    onPressed: () {
                      BlocProvider.of<SignupCubit>(context).RegisterCheck(data:{
                        "email":email_field.text.toString(),
                        "password":password_field.text.toString()
                      }, confirm_password: confirm_password.text.toString());

                      // Handle create account button press
                    },
                  ),
                  const SizedBox(height: 8), // Adjust the spacing as needed
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/signin');
                          // Handle Sign In tap
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF53B0A2),
                            decoration: TextDecoration.underline,
                          )))])])),
                          BlocConsumer<SignupCubit,SignupState>(
                              builder: (context, state) {
                                if(state is SignupLoaded){
                                  return CircularProgressIndicator();
                                }
                                else if(state is SignupFailure){
                                  return Text(state.message.toString());
                                }
                                return Container();
                              },
                              listener: (context, state) async {
                                if (state is SignupSuccess) {
                                  Response user_id = await Requests().SearchUser(search_query:email_field.text.toString()) as Response;
                                  Navigator.pushReplacementNamed(context, '/havingBiz',
                                      arguments: user_id.data[0]['id']);
                                }
                              })
          ])));
  }
}
