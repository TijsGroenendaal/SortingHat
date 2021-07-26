part of 'main.dart';

class DatabaseHelper {

  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnFict = 'F';
  static final columnIat = 'I';
  static final columnSe = 'S';
  static final columnBdam = 'B';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = paths.join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnFict INTEGER NOT NULL,
            $columnIat INTEGER NOT NULL,
            $columnSe INTEGER NOT NULL,
            $columnBdam INTEGER NOT NULL
          )
    ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  void insert() async {
    Database db = await instance.database;
    await db.rawInsert('INSERT INTO $table($columnName, $columnFict, $columnIat, $columnSe, $columnBdam) ' + 'VALUES("' +
        naam.toString()           + '", ' +
        specWaardes[0].toString() + ', ' +
        specWaardes[1].toString() + ', ' +
        specWaardes[2].toString() + ', ' +
        specWaardes[3].toString() +
        ')'
    );
  }


  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<List<Map<String, dynamic>>> queryRow(int id) async {
    Database db = await instance.database;
    return db.query(table, );
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  void update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id.
  void delete(int id) async {
    Database db = await instance.database;
    await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  //Deletes all rows
  void deleteAll() async {
    Database db = await instance.database;
    db.delete(table);
  }

  Future<List<Map<String, dynamic>>> getPrimarys() async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT $columnId FROM $table');
  }
}