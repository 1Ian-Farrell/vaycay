import 'package:flutter/material.dart';

class MyMainDrawer extends StatelessWidget {
  const MyMainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // drawer header
          DrawerHeader(child: Icon(Icons.person)
          ),

          // home tile
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text(' L I K E D'),
            ),
          )
        ],
      ),
    );
  }
}