import 'package:flutter/material.dart';

class AppBarClass extends StatelessWidget{
  const AppBarClass({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor:const Color.fromARGB(255, 0, 0, 0), // 1
          // elevation: 5, // 2
          iconTheme: const IconThemeData(color: Colors.purple),
          title: const Text(
            'Select Your Favorite Cuisine',
            style: TextStyle(
              color: Colors.white,
              fontWeight:FontWeight.bold,
              fontSize: 20,
            ),
          ),
        
        );
  }
}
