import 'package:flutter/material.dart';

Widget buildSectionTitle(BuildContext context, String text) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    ),
  );
}