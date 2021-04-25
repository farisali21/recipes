import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../models/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        primary: false,
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 2.5 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: Dummy_Categories.map(
          (type) => CategoryItem(
            type.id,
            type.title,
            type.color,
          ),
        ).toList(),
    );
  }
}
