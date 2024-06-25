import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FilterNotifer extends StateNotifier<Map<Filters, bool>>{
  FilterNotifer():super({
      Filters.glutenFree: false,
      Filters.lactoseFree: false,
      Filters.vegetarian: false,
      Filters.vegan: false,
  });

  void setFilter(Filters filter, bool isActive){
      state = {
        ...state,
        filter:isActive,
      };
  }
}


final filterProvide = StateNotifierProvider<FilterNotifer,Map<Filters,bool>>((ref) => 
  FilterNotifer()
);