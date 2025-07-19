import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalmanagementadmin/data/services/auth_services.dart';
import 'package:hospitalmanagementadmin/presentation/auth/sign_in.dart';
import 'package:hospitalmanagementadmin/presentation/widgets/drawer_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Left side with background image and logo
            Container(
              width: size.width * 0.5,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFB0E0E6), Color(0xFF4682B4)],
                ),
              ),
              child: Stack(
                children: [
                  // Background image (partial stethoscope)
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.9,
                      child: Image.network(
                        'assets/images/General-Physicians.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Logo and tagline
                  Positioned(
                    left: 40,
                    bottom: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo
                        Row(
                          children: [
                            // Custom pill logo
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF4682B4),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Container(
                                    width: 20,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFB347),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "MEDIGRAPH",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Tagline
                        const Text(
                          "Empowering Healthcare, One Click at a Time:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          "Your Health, Your Records, Your Control.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Right side with login form
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                color: Colors.white,
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Small logo
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 20,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4682B4),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFB347),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                      
                          // Login text
                          const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                          const SizedBox(height: 8),
                      
                          // Subtitle
                          const Text(
                            "Log in to your account.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF718096),
                            ),
                          ),
                          const SizedBox(height: 40),
                      
                          // Email field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4A5568),
                                ),
                              ),
                              const SizedBox(height: 8),
                              // TextFormField(
                              //   controller: _emailController,
                              //   decoration: InputDecoration(
                              //     hintText: "Enter your email",
                              //     contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //       borderSide: BorderSide(color: Colors.grey.shade300),
                              //     ),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //       borderSide: BorderSide(color: Colors.grey.shade300),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //       borderSide: const BorderSide(color: Color(0xFF4682B4)),
                              //     ),
                              //   ),
                              //   keyboardType: TextInputType.emailAddress,
                              // ),
                              normaltextfield(
                                'Email',
                                Icons.email_outlined,
                                _emailController,
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
                            ],
                          ),
                          const SizedBox(height: 20),
                      
                          // Password field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4A5568),
                                ),
                              ),
                              const SizedBox(height: 8),
                              // TextFormField(
                              //   controller: _passwordController,
                              //   obscureText: _obscurePassword,
                              //   decoration: InputDecoration(
                              //     hintText: "Enter your password",
                              //     contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //       borderSide: BorderSide(color: Colors.grey.shade300),
                              //     ),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //       borderSide: BorderSide(color: Colors.grey.shade300),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //       borderSide: const BorderSide(color: Color(0xFF4682B4)),
                              //     ),
                              //     suffixIcon: IconButton(
                              //       icon: Icon(
                              //         _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              //         color: Colors.grey,
                              //       ),
                              //       onPressed: () {
                              //         setState(() {
                              //           _obscurePassword = !_obscurePassword;
                              //         });
                              //       },
                              //     ),
                              //   ),
                              // ),
                              passwordTextField(
                                'Enter',
                                true,
                                _passwordController,
                                (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                      
                          // Forgot password
                          // Align(
                          //   alignment: Alignment.centerRight,
                          //   child: TextButton(
                          //     onPressed: () {},
                          //     child: const Text(
                          //       "Forgot Password?",
                          //       style: TextStyle(
                          //         color: Color(0xFF4682B4),
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 36),
                      
                          // Login button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                _submitForm(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4682B4),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                      
                          // Google login button
                          // SizedBox(
                          //   width: double.infinity,
                          //   height: 50,
                          //   child: OutlinedButton.icon(
                          //     icon: Image.asset(
                          //       'assets/icons/google_icon.png',
                          //       height: 18,
                          //       width: 18,
                          //     ),
                          //     label: const Text(
                          //       "Log in with Google",
                          //       style: TextStyle(
                          //         color: Color(0xFF4A5568),
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //     onPressed: () {},
                          //     style: OutlinedButton.styleFrom(
                          //       side: BorderSide(color: Colors.grey.shade300),
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(8),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 24),
                      
                          // // Sign up option
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     const Text(
                          //       "Don't have an account?",
                          //       style: TextStyle(
                          //         color: Color(0xFF718096),
                          //       ),
                          //     ),
                          //     TextButton(
                          //       onPressed: () {},
                          //       child: const Text(
                          //         "Sign Up",
                          //         style: TextStyle(
                          //           color: Color(0xFF4682B4),
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

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
