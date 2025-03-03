import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospitalmanagementadmin/core/constants.dart';
import 'package:hospitalmanagementadmin/presentation/auth/sign_in.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 70),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  themeColor,
                  themeColor2, // Dark Cyan
                ],
              ),
            ),
            height: 700,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Form(
                key: formkey,
                child: Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' Please sign up to continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 224, 224, 224),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          ' Email',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    normaltextfield(
                      'Email',
                      Icons.email_outlined,
                      emailController,
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          ' Password',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    passwordTextField('Enter', false, passwordController, (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    }),
                    Row(
                      children: [
                        Text(
                          ' Password',
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    passwordTextField('Confirm', true, confirmPasswordController, (
                      value,
                    ) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    }),
                    // Row(
                    //   children: [
                    //     Text(
                    //       ' Phone',
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         color: const Color.fromARGB(255, 0, 0, 0),
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //  normaltextfield('Number', Icons.phone_rounded),
                    SizedBox(height: 10),
                        
                    ElevatedButton(
                      onPressed: () {
                        signUpfunction(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        // fixedSize: Size(double.infinity, 20),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Sigh Up',
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUpfunction(String email, String password) async {
    log('$email: $password:$confirmPasswordController');
    if (formkey.currentState!.validate()) {
    //  await register(email, password);

      // Navigator.push(
      //                     // ignore: use_build_context_synchronously
      //                     context,
      //                     MaterialPageRoute(builder: (context) => BottomNavBar()),
      //                   );
    }
  }
}
