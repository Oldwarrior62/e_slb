import 'package:flutter/material.dart';
import '../appendices/appendices_drawer.dart';

class FireProvention extends StatelessWidget {
  const FireProvention({Key? key}) : super(key: key);
  static const routeName = '/fireProvention';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fire Provention'),
      ),
      drawer: AppendicesDrawer(),
      body: Column(
        children: [
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
