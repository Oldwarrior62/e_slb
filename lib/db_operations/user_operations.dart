import '../db/daily_report_database.dart';
import '../models/user_model.dart';

class UserOperations {
  UserOperations userOperations;

  final dbProvider = DailyReportRepository.instance;

  createDailyReport(User user) async {
    final db = await dbProvider.database;
    db.insert('User', user.toMap());
  }

  Future<List<User>> getAllUsers() async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> allRows = await db.query('User');
    List<User> user = allRows.map((user) => User.fromMap(User)).toList();
    return user;
  }

  Future<User> readCompany(int companyId) async {
    final db = await dbProvider.database;

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
