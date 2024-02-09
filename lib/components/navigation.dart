import 'package:gymman/database/models/workout.dart';
import 'package:gymman/pages/workout_update.dart';
import 'package:gymman/pages/workout_add.dart';
import 'package:gymman/pages/workouts.dart';
import 'package:gymman/pages/home.dart';
import 'package:flutter/material.dart';

class PageRouteAnimationless extends PageRouteBuilder {
  PageRouteAnimationless({
    required super.pageBuilder,
    super.transitionDuration = Duration.zero,
    super.reverseTransitionDuration = Duration.zero,
  });
}

void navigateHome(BuildContext context) => Navigator.push(context, PageRouteAnimationless(pageBuilder: (BuildContext context, a, b) { return HomePage(); }));
void navigateWorkouts(BuildContext context) => Navigator.push(context, PageRouteAnimationless(pageBuilder: (BuildContext context, a, b) { return WorkoutsPage(); }));
void navigateAddWorkout(BuildContext context) => Navigator.push(context, PageRouteAnimationless(pageBuilder: (context, a, b) { return WorkoutAddPage(); }));
void navigateEditWorkout(BuildContext context, WorkoutFullModel workout) => Navigator.push(context, PageRouteAnimationless(pageBuilder: (BuildContext context, a, b) { return WorkoutUpdatePage(workout: workout); }));
