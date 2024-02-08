import 'package:gymman/database/queries/create.dart';
import 'package:gymman/database/models/workout.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

_initDatabase() async {
  databaseFactory = databaseFactoryFfi;
  return openDatabase(
    join(await getDatabasesPath(), 'gymman.db'),
    onCreate: (db, version) => db.execute(createDatabaseQuery),
    version: 1
  );
}

_controllerAdd(table, obj) async { final db = await _initDatabase();
  db.insert(table, obj.toMap());
}

_controllerRemove(table, id) async { final db = await _initDatabase();
  await db.delete(table, where: 'id = ?', whereArgs: [id]);
}

_controllerList(table) async { final db = await _initDatabase();
  return await db.query(table);  
}

_controllerUpdate(table, obj) async { final db = await _initDatabase();
  await db.update(table, obj.toMap(), where: 'id = ?', whereArgs: [obj.id]);
}

class WorkoutController {
  final table = 'workouts';

  add(obj) => _controllerAdd(this.table, obj);
  remove(id) => _controllerRemove(this.table, id);
  update(obj) => _controllerUpdate(this.table, obj);
  list() async {
    final maps = await _controllerList(this.table);
    return List.generate(maps.length, (i) { return WorkoutFullModel(id: maps[i]['id'] as int, name: maps[i]['name'] as String); });
  }
}