import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category_structure.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.ontoggleFavouriteMeal,
    required this.getAvailableMeals,
  });

  final void Function(Meal meal) ontoggleFavouriteMeal;
  final List<Meal> getAvailableMeals;

  void _selectCategories(
      BuildContext context, CategoryStructure categoryStructure) {
    final filteredMeals = getAvailableMeals
        .where((meal) => meal.categories.contains(categoryStructure.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: categoryStructure.title,
          meals: filteredMeals,
          toggleFavouriteMeal: ontoggleFavouriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            categoryStructure: category,
            onSelectCategory: () {
              _selectCategories(context, category);
            },
          )
      ],
    );
  }
}
