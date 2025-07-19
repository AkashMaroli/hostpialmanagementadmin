import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalmanagementadmin/app_auth_listener.dart';
import 'package:hospitalmanagementadmin/data/services/data_base_services.dart';
import 'package:hospitalmanagementadmin/firebase_options.dart';
import 'package:hospitalmanagementadmin/presentation/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      onInit: () {
        JobRequestController();
      },
      theme: ThemeData(
        primaryColor: const Color(0xFF4C4CED),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4C4CED),
          primary: const Color(0xFF4C4CED),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home:
          //  LoginScreen()
          AuthStateListener(),
    );
  }
}
