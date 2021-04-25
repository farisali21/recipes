import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/meal.dart';
import '../widgets/meal-item.dart';

class CategoryMealsScreen extends StatefulWidget {

  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);

  static const String routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> categoryMeals;
  var _loadInitData = false;

  @override
  void didChangeDependencies() {
    if(!_loadInitData){
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = widget.availableMeal
          .where(
            (element) => element.categories.contains(categoryId),
      )
          .toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
            );
          }),
    );
  }
}
