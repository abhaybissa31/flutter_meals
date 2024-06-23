import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            DrawerHeader(padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.red,
                Colors.red.withOpacity(0.6),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                children: [
                  Icon(Icons.fastfood,size: 65, color: Theme.of(context).colorScheme.onPrimary,),
                  const SizedBox(width: 18,),
                  Text("Cook Up!",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary
                  ) ,)
                ],
              ),
            ),
            ListTile(
              splashColor: Colors.white,
              dense: true,
              enableFeedback: true,
             
              // iconColor: Colors.white,
              leading: Icon(Icons.restaurant,size: 26,color: Theme.of(context).colorScheme.inversePrimary,),
              title: Text("Meals",style:  Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24
                    ),
                    ),
                    onTap: (){},
            ),
             ListTile(
              splashColor: Colors.white,
              dense: true,
              enableFeedback: true,
             
              // iconColor: Colors.white,
              leading: Icon(Icons.filter_list,size: 26,color: Theme.of(context).colorScheme.inversePrimary,),
              title: Text("Filters",style:  Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24
                    ),
                    ),
                    onTap: (){},
            )
          ],
        ),
      ),
    );
  }
}
