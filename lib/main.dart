import 'package:gymman/pages/home.dart' show HomeStructure;
import 'package:flutter/material.dart';

void main() => runApp(const GymMan());

class GymMan extends StatelessWidget {
  const GymMan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeStructure(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark()
      )
    );
  }
}