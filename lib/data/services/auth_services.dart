import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// Sign in with email and password
Future<User?> signIn(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.user?.uid;

    return result.user;
  } catch (e) {
    print("Error signing in: $e");
    return null;
  }
}

// Sign out
Future<void> signOut() async {
  await _auth.signOut();
}
