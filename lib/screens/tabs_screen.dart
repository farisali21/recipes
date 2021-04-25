import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';
import './categories_screen.dart';
import './favourite_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPage = 0;
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(widget.favouriteMeals),
        'title': 'Your Favourite',
      }
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[selectedPage]['title']),
        ),
        drawer: DrawerScreen(),
        body: _pages[selectedPage]['page'],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              selectedPage = index;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'favourite',
            ),
          ],
        ),
      ),
    );
  }
}

///we can use this too
// DefaultTabController(
// length: 2,
// child: Scaffold(
// appBar: AppBar(
// title: Text('meals'),
// bottom: TabBar(
// tabs: [
// Tab(
// icon: Icon(
// Icons.category,
// ),
// text: 'Categories',
// ),
// Tab(
// icon: Icon(
// Icons.star,
// ),
// text: 'Favourite',
// ),
// ],
// ),
// ),
// body: TabBarView(children: [
// CategoryScreen(),
// FavouriteScreen(),
// ]),
// ),
// );
// }
// }
