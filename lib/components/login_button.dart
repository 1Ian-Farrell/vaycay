import 'package:flutter/material.dart';

class login_button extends StatelessWidget {

  final Function()? onTap;

  const login_button({
    super.key,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: onTap,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 38, 43, 43),
                          ),                  
                          height: 50,
                          width: 400,
                          child: Text(
                            'Log In',
                            textAlign: TextAlign.center,
                            style: TextStyle( 
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                            )
                        ),
                      ),
                    );
  }
}