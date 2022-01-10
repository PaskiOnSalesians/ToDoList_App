import 'dart:io';
import 'package:api_to_sqlite/src/models/activity_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Activity table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'activity_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Activity(
          id INTEGER PRIMARY KEY,
          name TEXT,
          priority TEXT
          )'''
        );
    });
  }

  // Insert Activity on database
  createActivity(Activity newActivity) async {
    await deleteAllActivities();
    final db = await database;
    final res = await db?.insert("Activity", newActivity.toJson());

    return res;
  }

  // Delete all activities
  Future<int?> deleteAllActivities() async {
    final db = await database;
    final res = await db?.rawDelete("DELETE * FROM Activity");

    return res;
  }

  Future<List<Activity?>> getAllActivities() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Activity");

    List<Activity> list = res!.isNotEmpty ? res.map((c) => Activity.fromJson(c)).toList() : [];

    return list;
  }
}
