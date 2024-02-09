import 'package:gymman/components/navigation.dart';
import 'package:gymman/database/controller.dart';
import 'package:gymman/components/navbar.dart';
import 'package:flutter/material.dart';

class WorkoutsStructure extends StatefulWidget {
  const WorkoutsStructure({super.key});

  @override
  State<WorkoutsStructure> createState() => _WorkoutsStructureState();
}

class _WorkoutsStructureState extends State<WorkoutsStructure> {
  List<Widget> _workouts = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _listWorkouts());
  }

  Future<void> _listWorkouts() async {
    final workouts = await WorkoutController().list();
    setState(() {
      _workouts = <Widget>[];
      for (final workout in workouts) {
        _workouts.add(
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Expanded(child: Text('  ' + workout.name, style: TextStyle(fontSize: 24))),
                IconButton(iconSize: 24, icon: const Icon(Icons.edit_rounded), onPressed: () { navigateEditWorkout(context, workout); }),
                IconButton(iconSize: 24, icon: const Icon(Icons.delete_rounded), onPressed: () { setState(() { WorkoutController().remove(workout.id); _listWorkouts(); }); })
              ]
            )
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavbar(context: context, id: 1).print(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          Column(children: _workouts),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [const SizedBox(width: 16), FloatingActionButton(onPressed: () { navigateAddWorkout(context); }, child: const Icon(Icons.add))]
          ))
        ])
      )
    );
  }
}