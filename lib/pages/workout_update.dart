import 'package:gymman/database/models/workout.dart';
import 'package:gymman/components/navigation.dart';
import 'package:gymman/database/controller.dart';
import 'package:gymman/components/navbar.dart';
import 'package:gymman/pages/workout.dart';
import 'package:flutter/material.dart';

class WorkoutUpdateStructure extends StatefulWidget {
  const WorkoutUpdateStructure({ super.key, required this.workout });
  final WorkoutFullModel workout;

  @override
  State<WorkoutUpdateStructure> createState() => _WorkoutUpdateStructureState(workout: this.workout);
}

class _WorkoutUpdateStructureState extends State<WorkoutUpdateStructure> {
  final form = TextEditingController();
  final WorkoutFullModel workout;

  _WorkoutUpdateStructureState({ required this.workout });

  @override
  void initState() {
    super.initState();
    form.text = this.workout.name;
  }

  Future<void> _submit() async {
    await WorkoutController().update(WorkoutFullModel(id: workout.id, name: form.text));
    setState(() {
      Navigator.push(context, PageRouteAnimationless(pageBuilder: (context, a, b) { return WorkoutsStructure(); }));
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