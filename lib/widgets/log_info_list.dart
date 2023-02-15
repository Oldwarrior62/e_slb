// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Comm/commHelper.dart';
import 'package:flutter_complete_guide/models/daily_report_model.dart';

import '../DatabaseHandler/DbHelper.dart';
import '../models/report_model.dart';

class LogInfoList extends StatelessWidget {
  final List<ReportInformation> logEntry;
  final Function strikeOutLog;
  List<DailyReport> lstdailyReports;
  LogInfoList(this.logEntry, this.strikeOutLog, this.lstdailyReports);

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: lstdailyReports.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'lib/images/logo.png',
                  width: mediaQuery.size.width * .8,
                ),
                Text(
                  'No log entered.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return logEntryItem(index, curScaleFactor, context);
              },
              itemCount: lstdailyReports.length,
            ),
    );
  }

  ListTile logEntryItem(
      int index, double curScaleFactor, BuildContext context) {
    return ListTile(
        leading: Text(
          "${lstdailyReports[index].timeCreated.toString()} |",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16 * curScaleFactor,
          ),
        ),
        title: Text(lstdailyReports[index].log.toString()),
        trailing: IconButton(
          onPressed: () async {
            DbHelper db = DbHelper.instance;
            await db
                .deleteDailyReport(lstdailyReports[index].dailyReportId!)
                .then((value) {
              alertDialog(context, "Report Deleted..");
              strikeOutLog(index);
            });
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ));
  }
}
