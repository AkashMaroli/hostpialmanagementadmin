import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hospitalmanagementadmin/data/services/auth_services.dart';
import 'package:hospitalmanagementadmin/presentation/widgets/drawer_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(255, 211, 240, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 70),
            child: Card(elevation: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color.fromARGB(255, 151, 225, 255),
                      // Light Sea Green
                      const Color.fromARGB(255, 130, 164, 177), // Dark Cyan
                    ],
                  ),
                ),
                height: MediaQuery.sizeOf(context).height / 1.5,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Form(
                    key: _formkey,
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
                          ' Please sign in to continue',
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 224, 224, 224),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
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
                        passwordTextField('Enter', true, passwordController, (
                          value,
                        ) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        }),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       'Forget Password?',
                        //       style: TextStyle(
                        //         fontSize: 18,
                        //         color: const Color.fromARGB(255, 0, 0, 0),
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 2,),
                        ElevatedButton(
                          onPressed: () {
                            _submitForm(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => BottomNavBar()),
                            // );
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
                            'Sign In',
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
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      User? user = await signIn(email, password);

      if (user != null) {
        // If user exists, navigate to BottomNavBar
        // Navigator.pushReplacement(
        //   // ignore: use_build_context_synchronously
        //   context,
        //   MaterialPageRoute(builder: (context) => ()),
        // );
        Get.off(HomeScreen());
      } else {
        // Show error message
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Invalid email or password')));
      }
    }
  }
}

// custom textformfield
Widget normaltextfield(
  String contentType,
  IconData icontype,
  TextEditingController controller,
  String? Function(String?) validator,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.white,
      hintText: 'Enter your $contentType',
      prefixIcon: Icon(icontype),
    ),
    validator: validator,
  );
}

// custom textfield for passwords etc
Widget passwordTextField(
  String content,
  bool need,
  TextEditingController controller,
  String? Function(String?) validator,
) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.white,
      hintText: '$content your password',
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(
          // Change icon based on password visibility
          need ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        ),
        onPressed: () {},
      ),
    ),
    validator: validator,
  );
}
