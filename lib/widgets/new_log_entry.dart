import 'package:flutter/material.dart';

class NewLogEntry extends StatefulWidget {
  final Function addNewLogIn;

  NewLogEntry(this.addNewLogIn);

  @override
  State<NewLogEntry> createState() => _NewLogEntryState();
}

class _NewLogEntryState extends State<NewLogEntry> {
  final entryController = TextEditingController();

  void submitData() {
    final enteredLog = entryController.text;

    if (enteredLog.isEmpty) {
      return;
    }

    widget.addNewLogIn(entryController.text);
    Navigator.of(context).pop();
    entryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 350,
          child:
              //requesting the user to input log entry.
              TextField(
            decoration: InputDecoration(labelText: 'Enter log'),
            controller: entryController,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              child: Text('Add log'),

              // textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ],
    );
  }
}
