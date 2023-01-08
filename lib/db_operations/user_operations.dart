import 'dart:async';

import 'package:sqflite/sqflite.dart';

import '../db/daily_report_database.dart';
import '../models/user_model.dart';

class UserOperations {
  UserOperations? userOperations;

  final dbProvider = DailyReportRepository.instance;

  createDailyReport(User user) async {
    final db = await (dbProvider.database as FutureOr<Database>);
    db.insert('User', user.toMap());
  }

  Future<List<User>> getAllUsers() async {
    final db = await (dbProvider.database as FutureOr<Database>);
    List<Map<String, dynamic>> allRows = await db.query('User');
    List<User> user = allRows.map((user) => User.fromMap(User)).toList();
    return user;
  }

  Future<User> readUser(int userId) async {
    final db = await (dbProvider.database as FutureOr<Database>);

    final maps = await db.query(
      userTable,
      columns: UserNotes.values,
      where: '${UserNotes} = ?',
      whereArgs: ['UserId'],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      throw Exception('User not found');
    }
  }
}
