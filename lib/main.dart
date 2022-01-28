import 'package:flutter/material.dart';
import './widgets/user_log_entry.dart';

import './widgets/header_info.dart';

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
  final locationControler = TextEditingController();
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
          //headerInfo ia daily information location, date, weather.
          //required at the top of each report.
          HeaderInfo(),
          SizedBox(
            height: 10,
          ),
          //three containers locking for user text input for
          //location, date, log entry.
          // Container(
          //   padding: EdgeInsets.all(10),
          //   child:
          //       //requesting the user to input location.
          //       // it's tempuary hard coded in
          //       //eventualy have it outomatic input option
          //       TextField(
          //     decoration: InputDecoration(labelText: 'Location'),
          //     controller: locationControler,
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   child:
          //       //requesting the user to input weather.
          //       // it's tempuary hard coded in
          //       //eventualy have it outomatic input option
          //       TextField(
          //     decoration: InputDecoration(labelText: 'Weather'),
          //     controller: weatherControler,
          //   ),
          // ),
          UserLogEntry(),
          //will be used to add a new log entry with current time.
        ],
      ),
    );
  }
}
