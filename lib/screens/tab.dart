import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectPageIndex = 0;

  final List<Meal> mealList = [];

  void showMessageFavourite(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleFavouriteMeal(Meal meal) {
    final favFood = mealList.contains(meal);

    if (favFood) {
      setState(() {
        mealList.remove(meal);
        showMessageFavourite('Removed from Favourites');
      });
    } else {
      setState(() {
        mealList.add(meal);
        showMessageFavourite('Added to Favourites');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      ontoggleFavouriteMeal: _toggleFavouriteMeal,
    );
    var activeTitle = 'Categories';
    if (_selectPageIndex == 1) {
      activePage = MealScreen(
        meals: mealList,
        toggleFavouriteMeal: _toggleFavouriteMeal,
      );
      activeTitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
