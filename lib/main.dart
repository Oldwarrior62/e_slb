import 'package:flutter/material.dart';

import './widgets/personal_info.dart';
import './widgets/Email_item.dart';
import './widgets/log_in.dart';
import './widgets/main_log_entry.dart';
import './widgets/new_user.dart';
import 'screens/tabsScreen.dart';
import './screens/user.dart';

//import 'widgets/main_log_entry.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-SLB',
      theme: ThemeData(
          // fontFamily: 'Quicksand',
          // textTheme: ThemeData.light().textTheme.copyWith(
          //       subtitle1: TextStyle(
          //         fontFamily: 'OpenSans',
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18,
          //       ),
          //       button: TextStyle(color: Colors.white),
          //     ),
          // appBarTheme: AppBarTheme(
          //   // ignore: deprecated_member_use
          //   textTheme: ThemeData.light().textTheme.copyWith(
          //         subtitle2: TextStyle(
          //           fontFamily: 'OpenSans',
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          // ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.amber)),
      // home: LogIn(),
      routes: {
        '/': (ctx) => LogIn(),
        '/log_in': (ctx) => LogIn(),
        NewUser.routeName: (ctx) => NewUser(),
        MainLogEntry.routeName: (ctx) => MainLogEntry(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
        Email.routeName: (ctx) => Email(),
        PersonalInfo.routeName: (ctx) => PersonalInfo(),
        User.routeName: (ctx) => User(),
      },
    );
  }
}
