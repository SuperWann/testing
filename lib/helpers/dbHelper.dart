import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;
  
  factory DbHelper() {
    return _instance;
  }

  DbHelper._internal();

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'bangunkebun_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      // onUpgrade: _onUpgrade,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<void> checkTables() async {
    final db = await database;
    List<Map<String, dynamic>> tables = await db.rawQuery(
      'SELECT name FROM sqlite_master WHERE type="table";',
    );
    print(tables);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE percakapan(
        id_percakapan INTEGER PRIMARY KEY AUTOINCREMENT,
        sender_type TEXT NOT NULL CHECK (sender_type IN ('user', 'bot')),
        pesan TEXT NOT NULL,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  // Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
  //   if (oldVersion == 2) {
  //     await db.execute('''
  //       CREATE TABLE food_places(
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         nama TEXT NOT NULL,
  //         alamat TEXT NOT NULL,
  //         latitude TEXT NOT NULL,
  //         longitude TEXT NOT NULL,
  //         image TEXT,
  //         review TEXT,
  //         created_at DATETIME DEFAULT CURRENT_TIMESTAMP
  //       )
  //     ''');
  //   }
  // }
}