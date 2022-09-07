import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class PersonalInfo extends StatelessWidget {
  static const routeName = '/personalInfo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Personal Information.'),
      ),
    );
  }
}
