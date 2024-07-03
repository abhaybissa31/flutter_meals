import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';
// import 'package:meals/provider/filters_provider.dart';



class FilterScreen extends ConsumerWidget{
  const FilterScreen({super.key});
  // final Map<Filters, bool> currentFilters;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvide);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.purple),
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
      body: 
    // Navigator.of(context).pop();
        Column(
          children: [
            SwitchListTile(
              enableFeedback: true,
              value: activeFilters[Filters.glutenFree]!,
              onChanged: (isChecked){
                ref.read(filterProvide.notifier).setFilter(Filters.glutenFree, isChecked);
              },
              title: Text(
                "Gluten-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text("Only include gluten-free meals.",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.purple),
            ),
            activeColor: Colors.purple,
            contentPadding:const EdgeInsets.only(left: 34, right: 22),
        ),
          
          SwitchListTile(
            enableFeedback: true,
              value: activeFilters[Filters.lactoseFree]!,
              onChanged: (isChecked){
                ref.read(filterProvide.notifier).setFilter(Filters.lactoseFree, isChecked);
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text("Only include Lactose-free meals.",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.purple),
            ),
            activeColor: Colors.purple,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
          
          SwitchListTile(
            enableFeedback: true,
              value: activeFilters[Filters.vegetarian]!,
              onChanged: (isChecked){
                ref.read(filterProvide.notifier).setFilter(Filters.vegetarian, isChecked);
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text("Only include Vegetarian meals.",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.purple),
            ),
            activeColor: Colors.purple,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
          
          SwitchListTile(
            enableFeedback: true,
              value: activeFilters[Filters.vegan]!,
              onChanged: (isChecked){
                ref.read(filterProvide.notifier).setFilter(Filters.vegan, isChecked);
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text("Only include Vegan meals.",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.purple),
            ),
            activeColor: Colors.purple,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
        ),
        
        ],
        ),
      );
  }
}
