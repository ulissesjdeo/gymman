import 'package:gymman/database/models/workout.dart';
import 'package:gymman/components/navigation.dart';
import 'package:gymman/database/controller.dart';
import 'package:gymman/components/navbar.dart';
import 'package:gymman/pages/workouts.dart';
import 'package:flutter/material.dart';

class WorkoutUpdatePage extends StatefulWidget {
  const WorkoutUpdatePage({ super.key, required this.workout });
  final WorkoutFullModel workout;

  @override
  State<WorkoutUpdatePage> createState() => _WorkoutUpdatePageState(workout: this.workout);
}

class _WorkoutUpdatePageState extends State<WorkoutUpdatePage> {
  final form = TextEditingController();
  final WorkoutFullModel workout;

  _WorkoutUpdatePageState({ required this.workout });

  @override
  void initState() {
    super.initState();
    form.text = this.workout.name;
  }

  Future<void> _submit() async {
    await WorkoutController().update(WorkoutFullModel(id: workout.id, name: form.text));
    setState(() {
      Navigator.push(context, PageRouteAnimationless(pageBuilder: (context, a, b) { return WorkoutsPage(); }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavbar(context: context, id: 1).print(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(controller: form, decoration: const InputDecoration(hintText: 'Nome do treino')),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(child: const Text('Atualizar'), onPressed: () => _submit())
                )
              ]
            )
          )
      )
    );
  }
}