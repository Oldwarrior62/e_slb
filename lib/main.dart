import 'package:flutter/material.dart';
import './widgets/header_info.dart';
import 'package:intl/intl.dart';

import './modles/report_information.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-SLB',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<ReportInformation> report = [
    ReportInformation(
      id: DateTime.now().toString(),
      entry: 'Test Text',
      date: DateTime.now(),
      //location: 'VIU'
    ),
    ReportInformation(
      id: DateTime.now().toString(),
      entry: 'Second entry',
      date: DateTime.now(),
      //location: 'VIU'
    ),
  ];

  final locationControler = TextEditingController();
  final entryControlerer = TextEditingController();
  final weatherControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Log Book'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          HeaderInfo(),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            // width: 250,
            //  child: Card(
            //color: Colors.blue,
            // elevation: 5,
            child: TextField(
              decoration: InputDecoration(labelText: 'Location'),
              controller: locationControler,
            ),
            // ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            // width: 250,
            //  child: Card(
            //color: Colors.blue,
            // elevation: 5,
            child: TextField(
              decoration: InputDecoration(labelText: 'Weather'),
              controller: weatherControler,
            ),
            // ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Entry text'),
                  controller: entryControlerer,
                ),
                FlatButton(
                  child: Text('Add entry'),
                  textColor: Colors.purple,
                  onPressed: () {
                    // print(titleController.text);
                  },
                ),
              ],
            ),
          ),
          Column(
            children: report.map((dr) {
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
                      child: Text(
                        DateFormat.Hm().format(dr.date),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(dr.entry)
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
