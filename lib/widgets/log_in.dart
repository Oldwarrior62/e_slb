import 'package:flutter/material.dart';

import '../screens/tabsScreen.dart';
//import '../widgets/new_user.dart';
import '../screens/user.dart';

//import '../widgets/main_log_entry.dart';
//import '../widgets/new_user.dart';

class LogIn extends StatelessWidget {
  void selectMainLogEntry(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(TabsScreen.routeName);
  }

  // void selectNewUser(BuildContext ctx) {
  //   Navigator.of(ctx).pushReplacementNamed(User.routeName);
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('E-SLB Log in'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'lib/images/logo.png',
            width: mediaQuery.size.width * .7,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 20,
              child: GestureDetector(
                onTap: () => selectMainLogEntry(context),
                child: Container(
                  child: Text('Log in'),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(User.routeName),
            child: Container(
              child: Text('Create New User'),
            ),
          ),
        ],
      ),
    );
  }
}
