import 'package:flutter/material.dart';

final colorScheme = ColorScheme.highContrastDark(
  background: Color.fromRGBO(0, 0, 0, 1)
);

final theme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  colorScheme: colorScheme,
  useMaterial3: true
);