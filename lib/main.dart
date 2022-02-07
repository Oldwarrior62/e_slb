import 'package:flutter/material.dart';

import './widgets/log_info_list.dart';
import './widgets/new_log_entry.dart';
import './widgets/header_info.dart';

import './modles/report_information.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-SLB',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ReportInformation> _report = [
    // ReportInformation(
    //   id: DateTime.now().toString(),
    //   logEntry: 'Test Text',
    //   date: DateTime.now(),
    //   //location: 'VIU'
    // ),
    // ReportInformation(
    //   id: DateTime.now().toString(),
    //   logEntry: 'Second entry',
    //   date: DateTime.now(),
    //   //location: 'VIU'
    // ),
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

  void _startNewLogEntry(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewLogEntry(_newLogEntry);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Log Book'),
        actions: [
          IconButton(
            onPressed: () => _startNewLogEntry(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),

            //headerInfo ia daily information location, date, weather.
            //required at the top of each report.
            HeaderInfo(),
            Divider(
              height: 3,
              thickness: 2,
              color: Colors.black,
            ),
            // SizedBox(
            //   height: 10,
            // ),

            //used to add a new log entry with current time.
            LogInfoList(_report),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewLogEntry(context),
      ),
    );
  }
}
