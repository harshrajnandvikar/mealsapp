import 'package:flutter/material.dart';
import 'package:meals/models/category_structure.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.categoryStructure});

  final CategoryStructure categoryStructure;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                categoryStructure.color.withOpacity(0.55),
                categoryStructure.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            categoryStructure.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )),
    );
  }
}
