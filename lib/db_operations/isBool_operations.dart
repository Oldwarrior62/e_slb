import '../db/daily_report_database.dart';
import '../models/isBool_model.dart';

final dbProvider = DailyReportRepository.instance;

createLocation(IsBool isBool) async {
  final db = await dbProvider.database;
  db.insert('IsBool', isBool.toMap());
}

Future<List<IsBool>> getAllLocations() async {
  final db = await dbProvider.database;
  List<Map<String, dynamic>> allRows = await db.query('Location');
  List<IsBool> isBool = allRows
      .map((location) => IsBool.fromMap(IsBool, null))
      .toList(); //not sure if right (IsBool, null) or (IsBool, ?)
  return isBool;
}
