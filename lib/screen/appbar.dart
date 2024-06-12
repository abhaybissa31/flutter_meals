import 'package:flutter/material.dart';

class AppBarClass extends StatelessWidget{
  const AppBarClass({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: Colors.black38.withOpacity(0.5), // 1
          elevation: 1, // 2
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
