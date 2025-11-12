import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vaycay_application/components/login_button.dart';
import 'package:vaycay_application/components/password_textfield.dart';
import 'package:vaycay_application/components/square_tile.dart';
import 'package:vaycay_application/components/username_textfield.dart';
import 'package:vaycay_application/pages/home_page.dart';
import 'package:vaycay_application/services/auth_service.dart';

class login_page extends StatefulWidget {
  final Function()? onTap;
  const login_page({super.key, required this.onTap});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  //text field controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
      );

      // pop loading circle
      if (context.mounted) Navigator.pop(context);

    } on FirebaseAuthException catch(e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message 
      showErrorMessage(e.code);
    }
   }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              )
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Container(
                        width: 350,
                        height: 300,
                        padding: EdgeInsets.only(left:25, right: 25, top:25, bottom:25),
                        child: Image.asset('assets/vaycay_logo.png')
                        ),
                    ),
                            
                      // Username
                            
                      UsernameTextfield(
                        usernamecontroller: emailController, 
                      ),
                            
                      // Password Textfield
                            
                       PasswordTextfield(
                        passwordcontroller: passwordController, 
                        obscureText: true,
                        hintText: 'password123',
                        labelText: 'Password',
                        ),
                      
                        // forgot password?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.grey[600]),
                                ),
                            ],
                          ),
                        ),
                  
                        // Login Button
                            
                      login_button(
                        onTap: signUserIn,
                      ),
                  
                        // or continue with
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey[400],
                                ),
                              ),
                          
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  'Or continue with', 
                                  style: TextStyle(color: Colors.grey[700])),
                              ),
                          
                              Expanded(
                                child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey[400],
                                ),
                              )
                            ],
                          ),
                        ),
                  
                        const SizedBox(height: 30,),
                  
                        // Google and Apple sign in buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // google
                            SquareTile(
                              onTap: () => AuthService().signInWithGoogle(),
                              imagePath: 'assets/google_logo_2.png',
                              ),
                  
                              const SizedBox(width: 20),
                  
                            // apple
                            SquareTile(
                              onTap: () {},
                              imagePath: 'assets/apple_logo.png',
                              ),
                          ]
                        ),
                  
                      SizedBox(height: 50),
                        // Sign Up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? '),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                          )
                        ]
                      ),
                  ]
                  ),
                  
                      ),
          ),
         
      );
  }
}