import 'package:flutter/material.dart';

Widget circleBar(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 12 : 8,
    width: isActive ? 12 : 8,
    decoration: BoxDecoration(
      color: isActive ? Colors.blue : Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}

