import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(task TEXT PRIMARY KEY)",
        );
      },
      version: 1,
    );
  }

  Future<List<String>> fetchTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) => maps[i]['task']);
  }

  Future<bool> insertTask(String task) async {
    final db = await database;
    try {
      await db.insert(
        'tasks',
        {'task': task},
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
