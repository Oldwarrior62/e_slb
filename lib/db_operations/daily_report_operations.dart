import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../db/daily_report_database.dart';
import '../models/company_model.dart';
import '../models/location_model.dart';
import '../models/daily_report_model.dart';

class DailyReportOperations {
  DailyReportOperations? dailyReportOperations;

  final dbProvider = DailyReportRepository.instance;

  createDailyReport(DailyReport dailyReport) async {
    final db = await (dbProvider.database as FutureOr<Database>);
    db.insert('dailyReport', dailyReport.toMap());
    print('Daily Report Inserted');
  }

  updateDailyReport(DailyReport dailyReport) async {
    final db = await (dbProvider.database as FutureOr<Database>);
    db.update('dailyReport', dailyReport.toMap(),
        where: 'dailyReportId=?', whereArgs: [dailyReport.dailyReportId]);
  }

  deleteDailyReport(DailyReport dailyReport) async {
    final db = await (dbProvider.database as FutureOr<Database>);
    await db.delete('dailyReport',
        where: 'dailyReportId=?', whereArgs: [dailyReport.dailyReportId]);
  }

  Future<List<DailyReport>> getAllDailyReports() async {
    final db = await (dbProvider.database as FutureOr<Database>);
    final orderBy = '${DailyReportNotes.dayCreated}';
    List<Map<String, dynamic>> allRows =
        await db.query('dailyReport', orderBy: orderBy);
    List<DailyReport> dailyReport =
        allRows.map((dailyReport) => DailyReport.fromMap(dailyReport)).toList();
    return dailyReport;
  }

  Future<List<DailyReport>> getAllContactsByCompany(Company company) async {
    final db = await (dbProvider.database as FutureOr<Database>);
    List<Map<String, dynamic>> allRows = await db.rawQuery('''
SELECT * FROM company WHERE dailyReport.FK_dailyReport_comany = Company.companyId
''');
    //dailyReport.FK_dailyReport_comany = ${Company.companyId} THIS GIVES A ERROR
    List<DailyReport> dailyReport =
        allRows.map((dailyReport) => DailyReport.fromMap(dailyReport)).toList();
    return dailyReport;
  }

  Future<List<DailyReport>> getAllContactsByLocation(Location location) async {
    final db = await (dbProvider.database as FutureOr<Database>);
    List<Map<String, dynamic>> allRows = await db.rawQuery('''
SELECT * FROM company WHERE dailyReport.FK_dailyReport_location = Location.locationId
''');
    List<DailyReport> dailyReport =
        allRows.map((dailyReport) => DailyReport.fromMap(dailyReport)).toList();
    return dailyReport;
  }

  Future<List<DailyReport>> searchDailyReport(Stringkeyword) async {
    final db = await (dbProvider.database as FutureOr<Database>);
    List<Map<String, dynamic>> allRows = await db.query('dailyReport',
        where: 'dayCreated LIKE ?', whereArgs: ['%keyword%']);
    List<DailyReport> dailyReport =
        allRows.map((dailyReport) => DailyReport.fromMap(dailyReport)).toList();
    return dailyReport;
  }

  Future<DailyReport> readCompany(int companyId) async {
    final db = await (dbProvider.database as FutureOr<Database>);

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
}
