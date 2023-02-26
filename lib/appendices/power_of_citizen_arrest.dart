import 'package:flutter/material.dart';
import '../appendices/appendices_drawer.dart';

class PowerOfCitizenArrest extends StatelessWidget {
  const PowerOfCitizenArrest({Key? key}) : super(key: key);
  static const routeName = '/citizenArrest';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Power of Citizen Arrest'),
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
