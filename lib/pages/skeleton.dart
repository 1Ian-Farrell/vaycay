import 'package:flutter/material.dart';
import 'package:vaycay_application/pages/your_feed.dart';
import 'package:vaycay_application/pages/home_page.dart';
import 'package:vaycay_application/pages/messages_page.dart';
import 'package:vaycay_application/pages/venture_page.dart';

class Skeleton extends StatefulWidget {
  Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int myIndex = 0;

  List<Widget> pages = [
    home_page(),
    VenturePage(),
    MyFeed(),
    MessagesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: myIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
      // navigation
      currentIndex: myIndex,
      onTap: (index) {
        setState(() {
          myIndex = index;
        });
      },
      fixedColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: [

        // home icon page
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        
        // venture icon page
        BottomNavigationBarItem(icon: Icon(Icons.hiking), label: 'Venture'),
        
        // create icon page
        BottomNavigationBarItem(icon: Icon(Icons.account_tree), label: 'Your Feed'),
        
        // messages icon page
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        ],
      )
    );
  }
}