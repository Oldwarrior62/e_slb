import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderInfo extends StatefulWidget {
  @override
  State<HeaderInfo> createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  final locationController = TextEditingController();

  final weatherController = TextEditingController();
  bool _validate = false;
  var location = 'VIU';
  var weather = 'Cold and wet';
  String date = DateFormat.yMMMMd().format(DateTime.now());

  void _startNewLogEntry(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: 'Enter Location',
                  errorText: _validate ? 'Location Can\'t Be Empty' : null,
                ),
                controller: locationController,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(
                  fontSize: 10,
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
                FlatButton(
                    child: Text(
                      'Add location',
                      style: TextStyle(
                        fontSize: 10,
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
                      clearText();
                    }),
                FlatButton(
                  child: Text(
                    'Add weather',
                    style: TextStyle(
                      fontSize: 10,
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
                    clearText();
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

  void clearText() {
    locationController.clear();
    weatherController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Location: ${location}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              //display for current year month day is submitted
              Text(
                date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child:
                  //display weather bottom left of header_info
                  //currently hard coded in
                  Text(
                'Weather: ${weather}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              child: Text('update'),
              onPressed: () => _startNewLogEntry(context),
            )
          ],
        )
      ],
    );
  }
}
