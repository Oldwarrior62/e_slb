import 'package:flutter/foundation.dart';

class ReportInformation {
  final String id;
  final String logEntry;
  final DateTime date;
  // final String location;
  // final String firstName;
  // final String lastName;

  ReportInformation({
    @required this.id,
    @required this.logEntry,
    @required this.date,
    // @required this.location,
  });
}
