import 'package:flutter/material.dart';
import 'package:meditofundraising/constants/styles/widget_styles.dart';

TextTheme meditoTextTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: dmSans),
    displayMedium: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w800, fontFamily: dmSans),
    displaySmall: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: dmSans),
    bodyLarge: TextStyle(fontSize: 18.0, fontFamily: dmSans),
    bodyMedium: TextStyle(fontSize: 16.0, fontFamily: dmSans),
    bodySmall: TextStyle(fontSize: 14.0, fontFamily: dmSans),
  );
}
