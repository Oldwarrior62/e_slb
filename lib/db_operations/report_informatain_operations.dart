import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../db/daily_report_database.dart';
import '../models/report_model.dart';

class ReportInformationOperations {
  ReportInformationOperations? reportInformationOperations;

  final dbProvider = DailyReportRepository.instance;

  createReportInformation(ReportInformation reportInformation) async {
    final db = await (dbProvider.database as FutureOr<Database>);
    db.insert('User', reportInformation.toMap());
  }

  Future<List<ReportInformation>> getAllUsers() async {
    final db = await (dbProvider.database as FutureOr<Database>);
    List<Map<String, dynamic>> allRows = await db.query('ReportInformation');
    List<ReportInformation> reportInfo = allRows
        .map((reportInformation) =>
            ReportInformation.fromMap(ReportInformationOperations()))
        .toList(); //should be ReportInformation not ReportInformationOperations()
    return reportInfo;
  }

  Future<ReportInformation> readCompany(int companyId) async {
    final db = await (dbProvider.database as FutureOr<Database>);

    final maps = await db.query(
      reportInformationTable,
      columns: reportInformationNotes.values,
      where: '${reportInformationNotes} = ?',
      whereArgs: ['reportInformationId'],
    );
    if (maps.isNotEmpty) {
      return ReportInformation.fromMap(maps.first);
    } else {
      throw Exception('Report Information not found');
    }
  }
}
