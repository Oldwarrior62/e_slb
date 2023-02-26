import 'package:flutter/material.dart';
import '../appendices/appendices_drawer.dart';

class PhoneticAlphabit extends StatelessWidget {
  const PhoneticAlphabit({Key? key}) : super(key: key);
  static const routeName = '/phonetic';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phonetic alphabit'),
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
