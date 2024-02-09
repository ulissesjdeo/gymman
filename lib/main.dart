import 'package:gymman/components/theme.dart';
import 'package:gymman/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const GymMan());

class GymMan extends StatelessWidget {
  const GymMan({super.key});

  @override
  Widget build(BuildContext context) { return MaterialApp(home: const HomePage(), theme: theme); }
}