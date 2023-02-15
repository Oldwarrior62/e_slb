import 'package:flutter/material.dart';

import '../models/daily_report_model.dart';

class DailyReportCardWidget extends StatelessWidget {
  DailyReportCardWidget({
    Key? key,
    required this.dailyReport,
    required this.index,
  }) : super(key: key);

  final DailyReport dailyReport;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Text(
          dailyReport.dateCreated.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
