import 'dart:io';
import 'package:flutter_complete_guide/models/daily_report_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DailyReportRepository {
  DailyReportRepository.privateConstructor();

  static final DailyReportRepository instance =
      DailyReportRepository.privateConstructor();
  final _dailyReportName = 'daily_report';
  final _databaseVersion = 1;

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
      return null;
    }
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dailyReportName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: await onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE dailyReport(
  dailyReportId INTEGER PRIMARY KEY AUTOINCREMENT,
  log TEXT NOT NULL,
  timeCreated TEXT NOT NULL,
  dateCreated TEXT NOT NULL,
  notes TEXT NOT NULL,
  weather TEXT NOT NULL,
  signature TEXT NOT NULL,
  FK_dailyReport_comany INTEGER NOT NULL,
  FK_dailyReport_location INTEGER NOT NULL,
  FK_dailyReport_logInfo INTEGER NOT NULL,
  FOREIGN KEY (FK_dailyReport_comany) REFERENCES company (companyId),
  FOREIGN KEY (FK_dailyReport_location) REFERENCES location (locationId),
  FOREIGN KEY (FK_dailyReport_logInfo) REFERENCES logInfo (reportInformationId),
)
''');
    await db.execute('''
CREATE TABLE user(
  name TEXT NOT NULL,
  surname TEXT NOT NULL,
  email TEXT NOT NULL,
)
''');
    await db.execute('''
CREATE TABLE company(
  companyId INTEGER PRIMARY KEY AUTOINCREMENT,
  companyName TEXT NOT NULL,
  logo TEXT NOT NULL,
  email TEXT NOT NULL,
)
''');
    await db.execute('''
CREATE TABLE logInfo(
  reportInformationId INTEGER PRIMARY KEY AUTOINCREMENT,
  logEntry TEXT NOT NULL,
  createdTime TEXT NOT NULL,
  )
''');

    await db.execute('''
CREATE TABLE isBool(
 isDyslexic BOOLEAN NOT NULL,
 isTwentyFour BOOLEAN NOT NULL,
 isDarkMode BOOLEAN NOT NULL,
)
''');
  }

  final dbProvider = DailyReportRepository.instance;

  Future<List<DailyReport>> getAllDailyReports() async {
    final db = await dbProvider.database;
    final orderBy = '${DailyReportNotes.dayCreated}';
    List<Map<String, dynamic>> allRows =
        await db.query('dailyReport', orderBy: orderBy);
    List<DailyReport> dailyReport =
        allRows.map((dailyReport) => DailyReport.fromMap(dailyReport)).toList();
    return dailyReport;
  }

  Future<DailyReport> readDailyReport(int dailyReportId) async {
    final db = await dbProvider.database;

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
    final db = await instance.database;
    db.close();
  }
}
