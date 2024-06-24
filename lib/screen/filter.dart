import 'package:flutter/material.dart';

enum Filters{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key,required this.currentFilters});
  final Map<Filters, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeValueSet = false;
  var _lactoseFreeValueSet = false;
  var _vegetarianValueSet = false;
  var _veganValueSet = false;

  @override
  void initState() {
    _glutenFreeValueSet = widget.currentFilters[Filters.glutenFree]!;
    _lactoseFreeValueSet = widget.currentFilters[Filters.lactoseFree]!;
    _vegetarianValueSet = widget.currentFilters[Filters.vegetarian]!;
    _veganValueSet = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), // 1
        title: const Text(
          'Your filters',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) async {
    if(didPop) return;
    Navigator.of(context).pop({
      Filters.glutenFree: _glutenFreeValueSet,
      Filters.lactoseFree: _lactoseFreeValueSet,
      Filters.vegetarian: _vegetarianValueSet,
      Filters.vegan: _veganValueSet,
    });
  
  },
        child: Column(
          children: [
            SwitchListTile(
              enableFeedback: true,
              value: _glutenFreeValueSet,
              onChanged: (isChecked){
              setState(() {
                    _glutenFreeValueSet = isChecked;
                  });
              },
              title: Text(
                "Gluten-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text("Only include gluten-free meals.",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding:const EdgeInsets.only(left: 34, right: 22),
        ),
          
          SwitchListTile(
            enableFeedback: true,
              value: _lactoseFreeValueSet,
              onChanged: (isChecked){
              setState(() {
                    _lactoseFreeValueSet = isChecked;
                  });
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text("Only include Lactose-free meals.",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
          
          SwitchListTile(
            enableFeedback: true,
              value: _vegetarianValueSet,
              onChanged: (isChecked){
              setState(() {
                    _vegetarianValueSet = isChecked;
                  });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text("Only include Vegetarian meals.",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
          
          SwitchListTile(
            enableFeedback: true,
              value: _veganValueSet,
              onChanged: (isChecked){
              setState(() {
                    _veganValueSet = isChecked;
                  });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text("Only include Vegan meals.",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        
        ],
        ),
      ),
    );
  }
}
