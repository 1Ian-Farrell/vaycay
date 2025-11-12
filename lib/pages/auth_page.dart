import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vaycay_application/pages/home_page.dart';
import 'package:vaycay_application/pages/login_or_register_page.dart';
import 'package:vaycay_application/pages/skeleton.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context, snapshot) {
          // user is logged in
            if (snapshot.hasData) {
              return Skeleton();
            }

          // user is NOT logged in
          else {
            return LoginOrRegisterPage();
          }
         }
        )
    );
  }
}