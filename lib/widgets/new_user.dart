import 'package:flutter/material.dart';

import '../screens/tabsScreen.dart';
import 'package:intl/intl.dart';

class NewUser extends StatefulWidget {
  static const routeName = '/new_user';

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final locationController = TextEditingController();
  final weatherController = TextEditingController();
  final firstNameController = TextEditingController();

  bool _validate = false;
  var location;
  var weather;
  String date = DateFormat.yMMMMd().format(DateTime.now());

  void selectMainLogEntry(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      TabsScreen.routeName,
    );
  }

  // Widget updateHeader(BuildContext ctx) {
  //   MaterialPageRoute(
  //     builder: (ctx) => HeaderInformation(location, weather),
  //   );
  // }

  // void submitData() {
  //   final enteredLog = firstNameController.text;

  //   if (enteredLog.isEmpty) {
  //     return;
  //   }

  void _NewWeather(BuildContext ctx) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(
                  fontSize: 10 * curScaleFactor,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: 'Enter weather',
                  errorText: _validate ? 'Weather Can\'t Be Empty' : null,
                ),
                controller: weatherController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(
                    'Add weather',
                    style: TextStyle(
                      fontSize: 10 * curScaleFactor,
                    ),
                  ),
                  // textColor: Colors.purple,
                  onPressed: () {
                    setState(
                      () {
                        weatherController.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                        weather = weatherController.text;
                      },
                    );
                    // clearText();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _newLocation(BuildContext ctx) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(
                  fontSize: 10 * curScaleFactor,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: 'Enter Location',
                  errorText: _validate ? 'Location Can\'t Be Empty' : null,
                ),
                controller: locationController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    child: Text(
                      'Add location',
                      style: TextStyle(
                        fontSize: 10 * curScaleFactor,
                      ),
                    ),
                    // textColor: Colors.purple,
                    onPressed: () {
                      setState(
                        () {
                          locationController.text.isEmpty
                              ? _validate = true
                              : _validate = false;
                          location = locationController.text;
                        },
                      );
                      //clearText();
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    // final data = HeaderInformation(
    //   id: DateFormat('dd/MM/yyyy —   HH:mm:ss:S').format(DateTime.now()),
    //   // date: DateFormat('dd/MM/yyyy —   HH:mm:ss:S').format(DateTime.now()),
    //   location: location,
    // );

    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        title: Text('E-SLB New user'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Location: ${location}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14 * curScaleFactor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _newLocation(context),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text('update location'),
                        ),
                      ),
                    ),
                  ],
                ),
                //display for current year month day is submitted
                Text(
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12 * curScaleFactor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child:
                        //display weather bottom left of header_info
                        //currently hard coded in
                        Text(
                      'Weather: ${weather}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _NewWeather(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text('update weather'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // SizedBox(
          //   height: 50,
          // ),
          // TextButton(
          //   child: const Text('Submit'),
          //   onPressed: () {
          //     selectMainLogEntry(context);
          //   },
          // ),
          // SizedBox(
          //   height: 50,
          // ),
          // RaisedButton(
          //   child: Text('update'),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => HeaderInfo(
          //           data: data,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          SizedBox(
            height: 50,
          ),
          TextButton(
              child: Text('update'),
              onPressed: () {
                selectMainLogEntry(context);
              }),
        ],
      ),
    );
  }
}
