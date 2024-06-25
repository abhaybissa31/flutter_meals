import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/mealmodel.dart';

// Use Provider() for static list and if we need to change list or having a dynamic need, we need to use StateNotifierProvider()

class FavMealNotifier extends StateNotifier<List<MealModel>>{
FavMealNotifier():super([]);

 bool toggleMealFavStatus(MealModel mealModel){
  // we cannot add or remove from a provider list so we have to create a new list
  final mealIsFav = state.contains(mealModel);

  if (mealIsFav) {
    // the below code creates a new list so we can use it
    state = state.where((m) => m.id != mealModel.id).toList();
    return false;
  }else{
    state = [...state, mealModel];
    return true;
  }
}
}

final favMealProvider = StateNotifierProvider<FavMealNotifier, List<MealModel>>((ref){
  return FavMealNotifier();
});