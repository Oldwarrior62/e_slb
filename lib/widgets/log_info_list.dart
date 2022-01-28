import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modles/report_information.dart';

class LogInfoList extends StatelessWidget {
  final List<ReportInformation> logEntry;

  LogInfoList(this.logEntry);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: logEntry.map((dr) {
        return Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.all(4),
                child:
                    //display for current time log entry is submitted
                    //this is automatically done in 24 hour clock
                    Text(
                  DateFormat.Hm().format(dr.date),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              //text submited by user in the log entry field
              //curently hard coded in
              Text(dr.logEntry)
            ],
          ),
        );
      }).toList(),
    );
  }
}
