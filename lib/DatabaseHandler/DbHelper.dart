import 'package:flutter_complete_guide/models/UserModel.dart';
import 'package:flutter_complete_guide/models/daily_report_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _database;
  DbHelper._privateConstructor();

  static DbHelper instance = DbHelper._privateConstructor();

  Future<Database> get database async {
    _database ??= await initializeDatabase();

    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String dbpath = await getDatabasesPath();
    dbpath = "$dbpath/mydb.db";
    var stddb = await openDatabase(dbpath, version: 1, onCreate: _createdb);
    return stddb;
  }

  void _createdb(Database db, int newversion) async {
    // creations of tables
    await db.execute('''
CREATE TABLE dailyReport(
  dailyReportId INTEGER PRIMARY KEY AUTOINCREMENT,
  log TEXT,
  timeCreated TEXT,
  dateCreated TEXT,
  notes TEXT,
  weather TEXT,
  signature TEXT,
  location  TEXT, 
  companyName TEXT,
  logo TEXT    
)
''');
    await db.execute('''
CREATE TABLE user(
  name TEXT,
  surname TEXT,  
  email TEXT,
  password TEXT
)
''');
    await db.execute('''
CREATE TABLE isBool(
 isDyslexic BOOLEAN,
 isTwentyFour BOOLEAN,
 isDarkMode BOOLEAN
)
''');
    print('table created..');
  }

  Future<List<DailyReport>> getAllDailyReports() async {
    Database db = await instance.database;
    final orderBy = '${DailyReportNotes.dayCreated}';
    List<Map<String, dynamic>> allRows =
        await db.query('dailyReport', orderBy: orderBy);
    List<DailyReport> dailyReport =
        allRows.map((dailyReport) => DailyReport.fromMap(dailyReport)).toList();
    return dailyReport;
  }

  Future<DailyReport> readDailyReport(int? dailyReportId) async {
    Database db = await instance.database;

    final maps = await db.query(
      dailyReportTable,
      columns: DailyReportNotes.values,
      where: '${DailyReportNotes} = ?',
      whereArgs: ['reportInformationId'],
    );
    if (maps.isNotEmpty) {
      return DailyReport.fromMap(maps.first);
    } else {
      throw Exception('Daily Report Information not found');
    }
  }

  Future close() async {
    Database db = await instance.database;
    db.close();
  }

  Future<int?> saveData(UserModel user) async {
    Database db = await instance.database;
    int result = await db.insert('user', user.toMap());
    return result;
  }

  Future<UserModel?> getLoginUser(name, String password) async {
    assert(name != null);
    var dbClient = await _database;
    var res = await dbClient?.rawQuery("SELECT * FROM user WHERE "
        "name = '$name' AND "
        "password = '$password'");

    if (res!.length > 0) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  updateUser(UserModel user) {}

  deleteUser(String delUserID) {}
}
