import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(selectedColor >= 0, 'Selected color must not be negative'),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: false),
  );
}
