import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class FiltersScreen extends StatefulWidget {

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(this.currentFilter ,this.saveFilters);

  static const String routeName = '/filter-screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
     _glutenFree = widget.currentFilter['gluten'];
     _lactoseFree = widget.currentFilter['lactose'];
     _vegetarian = widget.currentFilter['vegetarian'];
     _vegan = widget.currentFilter['vegan'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Filters'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilter);
            },
          ),
        ],
      ),
      drawer: DrawerScreen(),
      body: Column(
        children: [
          Container(
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  text: 'Gluten-free',
                  subtitleText: 'Only include gluten free',
                  setState: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  secondValue: _glutenFree,
                ),
                buildSwitchListTile(
                  text: 'Lactose-free',
                  subtitleText: 'Only include lactose free',
                  setState: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  secondValue: _lactoseFree,
                ),
                buildSwitchListTile(
                  text: 'Vegetarian',
                  subtitleText: 'Only include vegetarian meals',
                  setState: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  secondValue: _vegetarian,
                ),
                buildSwitchListTile(
                  text: 'Vegan',
                  subtitleText: 'Only include vegan meals',
                  setState: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  secondValue: _vegan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      {@required String text,
      @required String subtitleText,
      @required bool secondValue,
      @required Function setState}) {
    return SwitchListTile(
      title: Text(text),
      value: secondValue,
      subtitle: Text(subtitleText),
      onChanged: setState,
    );
  }
}
