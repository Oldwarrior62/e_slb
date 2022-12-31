import '../db/daily_report_database.dart';
import '../models/location_model.dart';

final dbProvider = DailyReportRepository.instance;

createLocation(Location location) async {
  final db = await dbProvider.database;
  db.insert('Location', location.toMap());
}

Future<List<Location>> getAllLocations() async {
  final db = await dbProvider.database;
  List<Map<String, dynamic>> allRows = await db.query('Location');
  List<Location> location =
      allRows.map((location) => Location.fromMap(Location)).toList();
  return location;
}

Future<Location> readCompany(int companyId) async {
  final db = await dbProvider.database;

  final maps = await db.query(
    locationTable,
    columns: LocationNotes.values,
    where: '${LocationNotes} = ?',
    whereArgs: ['LocationId'],
  );
  if (maps.isNotEmpty) {
    return Location.fromMap(maps.first);
  } else {
    throw Exception('Location Information not found');
  }
}
