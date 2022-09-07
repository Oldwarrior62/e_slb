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
    } else
      widget.addNewLogIn(entryController.text);
    Navigator.of(context).pop();
    entryController.clear();
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
