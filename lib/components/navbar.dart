import 'package:gymman/pages/workout.dart';
import 'package:gymman/pages/home.dart';
import 'package:flutter/material.dart';

class R extends PageRouteBuilder {
  R({
    required super.pageBuilder,
    super.transitionDuration = Duration.zero,
    super.reverseTransitionDuration = Duration.zero,
  });
}

class MyNavbar {
  BuildContext context;
  int id;

  MyNavbar({ required this.context, required this.id });

  receive() {
    return NavigationBar(
      selectedIndex: id,
      indicatorColor: Colors.white,
      onDestinationSelected: (i) {
        switch (i) {
          case 0:
            Navigator.push(context, R(pageBuilder: (context, a, b) { return HomeStructure(); })); break;
          case 1: 
            Navigator.push(context, R(pageBuilder: (context, a, b) { return WorkoutsStructure(); })); break;
        }
      },
      destinations: const [
        const NavigationDestination(
          label: 'Home',
          selectedIcon: const Icon(Icons.home),
          icon: const Icon(Icons.home_outlined)
        ),
        const NavigationDestination(
          label: 'Workouts',
          selectedIcon: const Icon(Icons.sports_gymnastics),
          icon: const Icon(Icons.sports_gymnastics_outlined)
        )
      ]
    );
  }
}