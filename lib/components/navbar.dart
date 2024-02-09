import 'package:gymman/components/navigation.dart';
import 'package:flutter/material.dart';

class MyNavbar {
  BuildContext context;
  int id;

  MyNavbar({ required this.context, required this.id });

  NavigationBar print() {
    return NavigationBar(
      selectedIndex: id,
      surfaceTintColor: Colors.black,
      backgroundColor: Colors.black,
      indicatorColor: Colors.white,
      onDestinationSelected: (i) {
        switch (i) {
          case 0: navigateHome(context); break;
          case 1: navigateWorkouts(context); break;
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