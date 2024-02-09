class WorkoutModel {
  final String name;
  const WorkoutModel({ required this.name });
  Map<String, Object?> toMap() => {'name': name};
}

class WorkoutFullModel extends WorkoutModel {
  int id;
  WorkoutFullModel({ required this.id, required super.name });
}