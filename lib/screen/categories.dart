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
            childAspectRatio: 1.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 25
            ),
        children:  [
          // const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
          for(final categoryModel in availableCategories)
            categoryModel.card 
            
          // Text("1",style: TextStyle(color: Colors.white),),  fit: BoxFit.fill,
          // ,
          // CardData(imageAddress: "lib/assets/images/cat_italian.jpg",imageText: "Italian",),
          // CardData(imageAddress: "lib/assets/images/cat_indian.jpg",imageText: "Indian",),
          // CardData(),
          // CardData(),
          // CardData(),
          // CardData(),
          // const Text("2",style: TextStyle(color: Colors.white),),
          // const Text("3",style: TextStyle(color: Colors.white),),
          // const Text("4",style: TextStyle(color: Colors.white),),
          // const Text("5",style: TextStyle(color: Colors.white),),
          // const Text("6",style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
