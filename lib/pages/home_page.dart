import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vaycay_application/components/bottom_nav_bar.dart';
import 'package:vaycay_application/components/my_main_drawer.dart';

class home_page extends StatelessWidget {
  home_page({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyMainDrawer(),
      body: Center(
        child: Column(
          children: [
            //top section of home page/ dashboard
            Stack(
              children: [
                Container(

                  // color can later be toggled by user
                  color: const Color.fromARGB(255, 113, 169, 215),
                  height: 250,
                ),

                //user icon image
                Positioned.fill( 
                top: -40,
                child: Align(alignment:Alignment.center, 
                child: Icon(Icons.person, size: 60,))),

                // sign user out
                Positioned(
                  top: 60,
                  right: 15,
                  child: IconButton(
                    onPressed: signUserOut, 
                    icon: Icon(Icons.logout)
                  ),
                ),
              ]
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 175,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    
                    ),
                )
              ],
            ),
            // remember what I am signed in as (change later on)
            Text(
              'LOGGED IN AS: ${user.email!}',
              style: TextStyle(fontSize: 20),
                  ),
            ]
        ),
    ),
    );
  }
}
int myIndex = 0;