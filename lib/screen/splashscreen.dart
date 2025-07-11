import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screen/login.dart';
import '../screen/homescreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkLoginState(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return snapshot.data == true
              ? const HomeScreen()
              : const LoginPage();
        }
      },
    );
  }

  Future<bool> _checkLoginState() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
