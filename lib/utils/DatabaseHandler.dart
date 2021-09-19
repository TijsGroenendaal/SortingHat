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
  static final columnResult = 'RESULT';
  static final columnFICT = 'FICT';
  static final columnIAT = 'IAT';
  static final columnSE = 'SE';
  static final columnBDAM = 'BDAM';

  static Database db;

  static Future<void> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = paths.join(documentsDirectory.path, _databaseName);

    // await deleteDatabase(path);

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
            $columnResult TEXT NOT NULL,
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
        columnId: (LocalUser.name + LocalUser.specialisationPoints.toString()).hashCode,
        columnName: LocalUser.name,
        columnResult: LocalUser.specialisation,
        columnFICT: LocalUser.specialisationPoints['FICT'],
        columnIAT: LocalUser.specialisationPoints['IAT'],
        columnSE: LocalUser.specialisationPoints['SE'],
        columnBDAM: LocalUser.specialisationPoints['BDAM']
      }
    );
  }

  static Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await db.query(resultsTable);
  }

  static Future<void> delete(int id) async {
    await db.delete(resultsTable, where: '$columnId = ?', whereArgs: [id]);
  }
}
