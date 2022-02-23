import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../modles/report_information.dart';

class LogInfoList extends StatelessWidget {
  final List<ReportInformation> logEntry;
  final Function strikeOutLog;

  LogInfoList(this.logEntry, this.strikeOutLog);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: logEntry.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'lib/images/logo.png',
                  width: 325,
                ),
                Text(
                  'No log entered.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Colors.black),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: EdgeInsets.all(1.5),
                        child:
                            //display for current time log entry is submitted
                            //this is automatically done in 24 hour clock
                            Text(
                          DateFormat.Hm().format(logEntry[index].date),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      //text submited by user in the log entry field
                      //curently hard coded in
                      Container(
                        width: 225,
                        child: Text(
                          logEntry[index].logEntry,
                          style: TextStyle(fontSize: 15),
                          maxLines: 10,
                        ),
                      ),
                      IconButton(
                        onPressed: () => strikeOutLog(logEntry[index].id),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: logEntry.length,
            ),
    );
  }
}
