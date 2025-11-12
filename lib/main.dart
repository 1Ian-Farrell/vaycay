import 'package:flutter/material.dart';
import 'package:vaycay_application/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vaycay_application/pages/skeleton.dart';
import 'package:vaycay_application/pages/your_feed.dart';
import 'package:vaycay_application/pages/home_page.dart';
import 'package:vaycay_application/pages/login_or_register_page.dart';
import 'package:vaycay_application/pages/messages_page.dart';
import 'package:vaycay_application/pages/profile_page.dart';
import 'package:vaycay_application/pages/venture_page.dart';
import 'package:vaycay_application/theme/dark_mode.dart';
import 'package:vaycay_application/theme/light_mode.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),

      // these are all pages in the application for ease of navigation
      routes: {
        '/login_page':(context) => LoginOrRegisterPage(),
        '/home_page':(context) => home_page(),
        '/venture_page':(context) => VenturePage(),
        '/messages_page':(context) => MessagesPage(),
        '/user_feed':(context) => MyFeed(),
        '/profile_page':(context) => ProfilePage(),
      },

      // light theme
      // theme: lightMode,

      // dark theme
      // darkTheme: darkMode,
      
    );
  }
}