import 'package:flutter/material.dart';

import './log_entry_item.dart';
import '../modles/report_information.dart';

class LogInfoList extends StatelessWidget {
  final List<ReportInformation> logEntry;
  final Function strikeOutLog;

  const LogInfoList(this.logEntry, this.strikeOutLog);

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: logEntry.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'lib/images/logo.png',
                  width: mediaQuery.size.width * .8,
                ),
                Text(
                  'No log entered.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return LogEntryItem(
                  isLandScape: isLandScape,
                  mediaQuery: mediaQuery,
                  logEntry: logEntry[index],
                  curScaleFactor: curScaleFactor,
                  strikeOutLog: strikeOutLog,
                );
              },
              itemCount: logEntry.length,
            ),
    );
  }
}
