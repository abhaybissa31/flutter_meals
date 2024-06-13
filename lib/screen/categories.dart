import 'package:flutter/material.dart';
import 'package:meals/data/categorydata.dart';
import 'package:meals/screen/appbar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child:AppBarClass(),
      ),
    
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.6,
            // crossAxisSpacing: 1,
            // mainAxisSpacing: 1
            ),
        children:  [
          // const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
          for(final categoryModel in availableCategories)
            categoryModel.card
        ],
      ),
    );
  }
}
