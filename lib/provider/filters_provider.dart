import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meal_provider.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifer extends StateNotifier<Map<Filters, bool>> {
  FilterNotifer()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
        });

  void setAllFilters(Map<Filters, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvide = StateNotifierProvider<FilterNotifer, Map<Filters, bool>>(
    (ref) => FilterNotifer());

final filteredMeals = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(filterProvide);
  return meals.where((mealModel) {
    if (activeFilters[Filters.glutenFree]! && !mealModel.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filters.lactoseFree]! && !mealModel.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filters.vegan]! && !mealModel.isVegan) {
      return false;
    }
    if (activeFilters[Filters.vegetarian]! && !mealModel.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
