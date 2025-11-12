import 'package:flutter/material.dart';

class myNavBar extends StatefulWidget {
  const myNavBar({super.key});

  @override
  State<myNavBar> createState() => _myNavBarState();
}

class _myNavBarState extends State<myNavBar> {

int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
        
        // messages icon page
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        ],
      );
  }
}