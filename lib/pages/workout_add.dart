import 'package:gymman/database/models/workout.dart';
import 'package:gymman/database/controller.dart';
import 'package:gymman/components/navigation.dart';
import 'package:gymman/components/navbar.dart';
import 'package:gymman/pages/workout.dart';
import 'package:flutter/material.dart';

class WorkoutAddStructure extends StatefulWidget {
  const WorkoutAddStructure({ super.key });

  @override
  State<WorkoutAddStructure> createState() => _WorkoutAddStructureState();
}

class _WorkoutAddStructureState extends State<WorkoutAddStructure> {
  final form = TextEditingController();

  Future<void> _submit() async {
    await WorkoutController().add(WorkoutModel(name: form.text));
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
                  child: ElevatedButton(child: const Text('Adicionar'), onPressed: () => _submit())
                )
              ]
            )
          )
      )
    );
  }
}