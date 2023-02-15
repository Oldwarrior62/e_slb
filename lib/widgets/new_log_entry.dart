// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/DatabaseHandler/DbHelper.dart';
import 'package:flutter_complete_guide/comm/commHelper.dart';
import 'package:flutter_complete_guide/models/daily_report_model.dart';

import '../models/company_model.dart';

class NewLogEntry extends StatefulWidget {
  final Function addNewLogIn;

  NewLogEntry(this.addNewLogIn,
      {required this.selectedvalue,
      required this.lstcompany,
      required this.location,
      required this.weather});
  Company? selectedvalue;
  List<Company> lstcompany = [];
  String location;
  String weather;

  @override
  State<NewLogEntry> createState() => _NewLogEntryState();
}

class _NewLogEntryState extends State<NewLogEntry> {
  final entryController = TextEditingController();

  void submitData() {
    final enteredLog = entryController.text;

    if (enteredLog.isEmpty) {
      return;
    } else if (widget.selectedvalue == null) {
      alertDialog(context, "Company Must be Selected..");
      Navigator.of(context).pop();
    } else {
      String Date = DateTime.now().toString().split(' ')[0];
      String Time = DateTime.now().toString().split(' ')[1].split('.')[0];
      DbHelper db = DbHelper.instance;
      DailyReport dailyReport = DailyReport(
          0,
          entryController.text,
          Time,
          entryController.text,
          "",
          widget.weather,
          Date,
          widget.selectedvalue!.companyName,
          widget.location,
          0,
          widget.selectedvalue!.logoUrl);
      db.insertDailyReport(dailyReport).then((value) {
        widget.addNewLogIn(dailyReport);
        alertDialog(context, "Report Added");
      });
      Navigator.of(context).pop();
      entryController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child:
                //requesting the user to input log entry.
                TextField(
              decoration: const InputDecoration(labelText: 'Enter log'),
              controller: entryController,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: const Text('Add log'),

              // textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ],
    );
  }
}
