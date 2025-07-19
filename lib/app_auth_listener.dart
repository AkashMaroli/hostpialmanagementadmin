import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementadmin/presentation/auth/login_screen.dart';
import 'package:hospitalmanagementadmin/presentation/widgets/drawer_widget.dart';


class AuthStateListener extends StatelessWidget {
  const AuthStateListener({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return LoginScreen();
          } else {
            return HomeScreen();
          }
        }
        return Center(
          child: CircularProgressIndicator(backgroundColor: Colors.green),
        );
      },
    );
  }
}
