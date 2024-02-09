import 'package:gymman/database/queries/create.dart';
import 'package:gymman/database/models/workout.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

Future<Database> _initDatabase() async {
  databaseFactory = databaseFactoryFfi;
  return openDatabase(
    join(await getDatabasesPath(), 'gymman.db'),
    onCreate: (db, version) => db.execute(createDatabaseQuery),
    version: 1
  );
}

Future<void> _controllerAdd(String table, obj) async { final db = await _initDatabase();
  db.insert(table, obj.toMap());
}

Future<void> _controllerRemove(String table, int id) async { final db = await _initDatabase();
  await db.delete(table, where: 'id = ?', whereArgs: [id]);
}

Future<List<Map>> _controllerList(String table) async { final db = await _initDatabase();
  return await db.query(table);  
}

Future<void> _controllerUpdate(String table, obj) async { final db = await _initDatabase();
  await db.update(table, obj.toMap(), where: 'id = ?', whereArgs: [obj.id]);
}

class WorkoutController {
  final String table = 'workouts';

  add(WorkoutModel obj) => _controllerAdd(this.table, obj);
  remove(int id) => _controllerRemove(this.table, id);
  update(WorkoutFullModel obj) => _controllerUpdate(this.table, obj);
  list() async {
    final maps = await _controllerList(this.table);
    return List.generate(maps.length, (i) { return WorkoutFullModel(id: maps[i]['id'] as int, name: maps[i]['name'] as String); });
  }
}