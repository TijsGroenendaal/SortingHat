import 'dart:io';

import 'package:path/path.dart' as paths;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'User.dart';

class DatabaseHandler {
  static final _databaseName = "SortingHatDatabase.db";

  static final resultsTable = 'result_table';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnFICT = 'F';
  static final columnIAT = 'I';
  static final columnSE = 'S';
  static final columnBDAM = 'B';

  static Database db;

  static Future<void> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = paths.join(documentsDirectory.path, _databaseName);

    await deleteDatabase(path);

    db = await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate);
  }

  static Future<void> _onCreate(Database newDatabase, int version) async {
    await newDatabase.execute('''
          CREATE TABLE $resultsTable (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnFICT INTEGER NOT NULL,
            $columnIAT INTEGER NOT NULL,
            $columnSE INTEGER NOT NULL,
            $columnBDAM INTEGER NOT NULL
          )
    ''');
  }

  static Future<void> insert() async {
    await db.insert(
      resultsTable,
      {
        columnName: User.name,
        columnFICT: User.specialisationPoints[0],
        columnIAT: User.specialisationPoints[1],
        columnSE: User.specialisationPoints[2],
        columnBDAM: User.specialisationPoints[3]
      }
    );
  }

  static Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await db.query(resultsTable);
  }

  static Future<List<Map<String, dynamic>>> queryRow(int id) async {
    return db.query(resultsTable);
  }

  static Future<void> update(Map<String, dynamic> row) async {
    int id = row[columnId];
    await db.update(resultsTable, row, where: '$columnId = ?', whereArgs: [id]);
  }

  static Future<void> delete(int id) async {
    await db.delete(resultsTable, where: '$columnId = ?', whereArgs: [id]);
  }

  static Future<void> deleteAll() async {
    db.delete(resultsTable);
  }

  static Future<List<Map<String, dynamic>>> getPrimarys() async {
    return await db.rawQuery('SELECT $columnId FROM $resultsTable');
  }
}
