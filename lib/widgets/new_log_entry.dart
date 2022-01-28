import 'package:flutter/material.dart';

class NewLogEntry extends StatelessWidget {
  final Function addNewLogIn;
  final entryControlerer = TextEditingController();

  NewLogEntry(this.addNewLogIn);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child:
              //requesting the user to input log entry.
              // it's tempuary hard coded in
              //eventualy have it outomatic input option
              TextField(
            decoration: InputDecoration(labelText: 'Log entry'),
            controller: entryControlerer,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              child: Text('Add log entry'),
              textColor: Colors.purple,
              onPressed: () {
                addNewLogIn(entryControlerer.text);
              },
            ),
          ],
        ),
      ],
    );
  }
}
