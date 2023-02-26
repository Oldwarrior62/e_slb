import 'package:flutter/material.dart';
import '../appendices/appendices_drawer.dart';

class Whimis extends StatelessWidget {
  const Whimis({Key? key}) : super(key: key);
  static const routeName = '/whimis';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WHIMIS'),
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
