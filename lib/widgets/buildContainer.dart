import 'package:flutter/material.dart';

Widget buildContainer(Widget widget) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    height: 200,
    width: 300,
    child: widget,
  );
}