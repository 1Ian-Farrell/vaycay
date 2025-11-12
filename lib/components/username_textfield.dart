import 'package:flutter/material.dart';

class UsernameTextfield extends StatelessWidget {

  final usernamecontroller;
 

  const UsernameTextfield({
    super.key,
    required this.usernamecontroller,
    
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      hintText: 'name@email.com',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          ),
                        borderRadius: BorderRadius.circular(12)
                          
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                              ),
                  ),
                );
  }
}