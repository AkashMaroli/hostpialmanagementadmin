

import 'package:flutter/material.dart';
import 'package:hospitalmanagementadmin/core/constants.dart';
import 'package:hospitalmanagementadmin/presentation/auth/sign_up.dart';

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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 70),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    themeColor, // Light Sea Green
                    themeColor2, // Dark Cyan
                  ],
                ),
              ),
              height: MediaQuery.sizeOf(context).height/1.3,
              width: 500,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password?',
                            style: TextStyle(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                     //     _submitForm(context);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
          
                      ElevatedButton(
                        onPressed: () {
                  //         signInWithGoogle();
                           
                          //  Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => BottomNavBar(),
                          //   ),
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
                        child: Row(
                          spacing: 5,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              height: 35,
                              width: 35,
                              'assets/icons/google_logo.png',
                            ),
                            Text(
                              'Sign Up with Google',
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
    );
    
  }

//   void _submitForm(BuildContext context) async {
//     if (_formkey.currentState!.validate()) {
//       String email = emailController.text.trim();
//       String password = passwordController.text.trim();

//       User? user = await signIn(email, password);

//       if (user != null) {
//         // If user exists, navigate to BottomNavBar
//         Navigator.pushReplacement(
//           // ignore: use_build_context_synchronously
//           context,
//           MaterialPageRoute(builder: (context) => BottomNavBar()),
//         );
//       } else {
//         // Show error message
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text('Invalid email or password')));
//       }
//     }
//   }
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
