import 'package:flutter/material.dart';
import '../appendices/appendices_drawer.dart';

class Patrols extends StatelessWidget {
  const Patrols({Key? key}) : super(key: key);
  static const routeName = '/patrols';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrols'),
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
