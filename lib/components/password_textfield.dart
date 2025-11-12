import 'package:flutter/material.dart';

class PasswordTextfield extends StatelessWidget {

  final passwordcontroller;
  final bool obscureText;
  final String labelText;
  final String hintText;

  const PasswordTextfield({
    super.key,
    required this.passwordcontroller,
    required this.obscureText,
    required this.labelText,
    required this.hintText,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
                     padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                     child: TextField(
                      controller: passwordcontroller,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                        labelText: labelText,
                        labelStyle: TextStyle(color: Colors.grey[500]),
                        hintText: hintText,
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black,),
                          borderRadius: BorderRadius.circular(12)
                          
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        )
                      ),
                              ),
                   );
  }
}