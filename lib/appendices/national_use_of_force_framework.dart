import 'package:flutter/material.dart';
import '../appendices/appendices_drawer.dart';

class NationalForceFramwork extends StatelessWidget {
  const NationalForceFramwork({Key? key}) : super(key: key);
  static const routeName = '/force';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('National Use of Force Framework'),
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
