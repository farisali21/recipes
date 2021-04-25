import 'package:flutter/material.dart';

import 'package:food/models/meal.dart';
import '../widgets/meal-item.dart';


class FavouriteScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(
        child: Text('you have no favourite yet - start adding some'),
      );
    } else {
      return ListView.builder(
          itemCount: favouriteMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              duration: favouriteMeals[index].duration,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
            );
          });
    }

  }
}
