import 'package:flutter/material.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegeterian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilters;
  const FilterScreen({
    super.key,
    required this.currentFilters,
  });
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _switchgluten = false;
  var _lactosefree = false;
  var _vegeterian = false;
  var _veganbutton = false;

  @override
  void initState() {
    super.initState();
    _switchgluten = widget.currentFilters[Filter.glutenfree]!;
    _lactosefree = widget.currentFilters[Filter.lactosefree]!;
    _vegeterian = widget.currentFilters[Filter.vegeterian]!;
    _veganbutton = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          Navigator.of(context).pop({
            Filter.glutenfree: _switchgluten,
            Filter.lactosefree: _lactosefree,
            Filter.vegeterian: _vegeterian,
            Filter.vegan: _veganbutton,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _switchgluten,
              onChanged: (isSwitch) {
                setState(() {
                  _switchgluten = isSwitch;
                });
              },
              title: Text(
                'Glutten Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Gluten Free Meals are Added',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 32, left: 44),
            ),
            SwitchListTile(
              value: _lactosefree,
              onChanged: (isSwitch) {
                setState(() {
                  _lactosefree = isSwitch;
                });
              },
              title: Text(
                'Lactose Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Lactose Free Meals are Added',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 32, left: 44),
            ),
            SwitchListTile(
              value: _vegeterian,
              onChanged: (isSwitch) {
                setState(() {
                  _vegeterian = isSwitch;
                });
              },
              title: Text(
                'Vegeterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Vegeterian Meals are Added',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 32, left: 44),
            ),
            SwitchListTile(
              value: _veganbutton,
              onChanged: (isSwitch) {
                setState(() {
                  _veganbutton = isSwitch;
                });
              },
              title: Text(
                ' Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Vegan Meals are Added',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(right: 32, left: 44),
            ),
          ],
        ),
      ),
    );
  }
}
