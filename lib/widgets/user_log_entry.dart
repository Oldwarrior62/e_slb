import 'package:flutter/material.dart';

import '../widgets/log_info_list.dart';
import '../widgets/new_log_entry.dart';
import '../modles/report_information.dart';

class UserLogEntry extends StatefulWidget {
  @override
  _UserLogEntryState createState() => _UserLogEntryState();
}

class _UserLogEntryState extends State<UserLogEntry> {
  final List<ReportInformation> _report = [
    ReportInformation(
      id: DateTime.now().toString(),
      logEntry: 'Test Text',
      date: DateTime.now(),
      //location: 'VIU'
    ),
    ReportInformation(
      id: DateTime.now().toString(),
      logEntry: 'Second entry',
      date: DateTime.now(),
      //location: 'VIU'
    ),
  ];

  void _newLogEntry(String newLogEntry) {
    final newLogIn = ReportInformation(
      id: DateTime.now().toString(),
      logEntry: newLogEntry,
      date: DateTime.now(),
    );
    setState(() {
      _report.add(newLogIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogInfoList(_report),
        NewLogEntry(_newLogEntry),
      ],
    );
  }
}
