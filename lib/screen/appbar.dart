import 'package:flutter/material.dart';

class AppBarClass extends StatelessWidget{
  const AppBarClass({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
          shadowColor: Color.fromARGB(255, 255, 255, 255),
          backgroundColor: Color.fromARGB(255, 14, 14, 14), // 1
          elevation: 4, // 2
          title: const Text(
            'Select Your Favorite Cuisine',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        );
  }
}
