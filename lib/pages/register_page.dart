import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vaycay_application/components/password_textfield.dart';
import 'package:vaycay_application/components/sign_up_button.dart';
import 'package:vaycay_application/components/square_tile.dart';
import 'package:vaycay_application/components/username_textfield.dart';
import 'package:vaycay_application/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text field controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    // show loading circle
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  // try creating the user
    try {
      // check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text,
      );
      }else {
        // show error message, passwords don't match
        showErrorMessage("Passwords don't match!");
        Navigator.pop(context);
      }
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
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Container(
                        width: 350,
                        height: 250,
                        padding: EdgeInsets.only(left:25, right: 25, top:25, bottom:25),
                        child: Image.asset('assets/vaycay_logo.png')
                        ),
                    ),
                      //Let's create and account
                      Text(
                        'Let\'s create an account!',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),     

                        SizedBox(height: 15),
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

                        // Confirm Password Textfield
                            
                       PasswordTextfield(
                        passwordcontroller: confirmPasswordController, 
                        obscureText: true,
                        labelText: 'Confirm Password',
                        hintText: 'password123',
                        ),
                      
                        
                  
                        // Sign Up Button
                            
                      signUpButton(
                        onTap: signUserUp,
                        
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
                              imagePath: 'assets/apple_logo.png'
                              ),
                          ]
                        ),
                  
                      SizedBox(height: 50),
                        // Log In Page
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? '),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              'Login',
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