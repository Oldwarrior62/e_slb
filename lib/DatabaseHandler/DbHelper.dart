import 'package:flutter_complete_guide/Bloc/Notes/notesState.dart';
import 'package:flutter_complete_guide/models/UserModel.dart';
import 'package:flutter_complete_guide/models/company_model.dart';
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
    var stddb = await openDatabase(dbpath, version: 2, onCreate: _createdb);
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
    await db.execute('''
CREATE TABLE company(
 companyId INTEGER  PRIMARY KEY AUTOINCREMENT, 
 comapnyName TEXT,
 companyEmail Text,
 logoUrl Text
)

''');
    await db.execute('''
CREATE TABLE notes(
 notes TEXT,
 date Text
)''');
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
  //-----------------------------------------------------------------//

  Future<int?> saveData(UserModel user) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> templst = await db.query('user');
    for (var val in templst) {
      UserModel userModel = UserModel.fromMap(val);
      if (userModel.email == user.email &&
          userModel.password == user.password) {
        return -1;
      }
    }
    int result = await db.insert('user', user.toMap());
    return result;
  }

  Future<int?> updateUserData(UserModel user) async {
    Database db = await instance.database;
    int result = await db.update('user', user.toMap(),
        where: "email=?", whereArgs: [user.email]);
    return result;
  }

  Future<UserModel?> getLoginUser(String email, String password) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> templst = await db.query('user');
    for (var user in templst) {
      UserModel userModel = UserModel.fromMap(user);
      if (userModel.email == email && userModel.password == password) {
        return userModel;
      }
    }

    return null;
  }

  Future<int?> insertCompanyData(Company company) async {
    Database db = await instance.database;
    int result = await db.insert('company', company.toMap());
    return result;
  }

  Future<List<Company>> getAllCompany() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> allRows = await db.query('company');
    List<Company> allCompanies =
        allRows.map((company) => Company.fromMap(company)).toList();
    return allCompanies;
  }

  Future<int?> insertDailyReport(DailyReport dailyReport) async {
    Database db = await instance.database;
    int result = await db.insert('dailyReport', dailyReport.toMap());
    return result;
  }

  Future<List<DailyReport>> getAllReports() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> allRows = await db.query('dailyReport');
    List<DailyReport> allDailyReport =
        allRows.map((dailyReport) => DailyReport.fromMap(dailyReport)).toList();
    return allDailyReport;
  }

  Future<int?> deleteDailyReport(int id) async {
    Database db = await instance.database;
    int result = await db
        .delete('dailyReport', where: 'dailyReportId=?', whereArgs: [id]);
    return result;
  }

  Future<int?> insertNotes(Notes notes) async {
    Database db = await instance.database;
    int result = await db.insert('notes', notes.toMap());
    return result;
  }

  Future<int?> updateNotes(Notes notes) async {
    Database db = await instance.database;
    int result = await db.update('notes', notes.toMap(),
        where: 'date=?', whereArgs: [notes.date]);
    return result;
  }

  Future<Notes?> checkNotes() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> allRows = await db.query('notes');
    List<Notes> allNotes =
        allRows.map((notes) => Notes.fromjson(notes)).toList();
    Notes? notes;
    if (allNotes.length > 0) {
      DateTime dt1 =
          DateTime.parse("${allNotes.last.date!.split(' ')[0]} 00:00:00");
      DateTime dt2 =
          DateTime.parse("${DateTime.now().toString().split(' ')[0]} 00:00:00");
      if (dt2.isAfter(dt1)) {
      } else if (dt2.isAtSameMomentAs(dt1)) {
        notes = allNotes.last;
      }
    }
    return notes;
  }

  Future<List<Notes>> getNotes() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> allRows = await db.query('notes');
    List<Notes> allNotes =
        allRows.map((notes) => Notes.fromjson(notes)).toList();
    return allNotes;
  }
}
