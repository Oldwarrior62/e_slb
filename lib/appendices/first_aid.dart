import 'package:flutter/material.dart';
import '../appendices/appendices_drawer.dart';

class FirstAid extends StatelessWidget {
  const FirstAid({Key? key}) : super(key: key);
  static const routeName = '/firstAid';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid'),
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
