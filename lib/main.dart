import 'package:flutter/material.dart';

import '../widgets/details_page.dart';
import './widgets/date_selected.dart';
import './widgets/location_selected.dart';
import './widgets/company_selected.dart';
import './widgets/personal_info.dart';
import './widgets/Email_item.dart';
import './widgets/log_in.dart';
import './widgets/main_log_entry.dart';
import './widgets/new_user.dart';
import 'widgets/user_form.dart';

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
        Email.routeName: (ctx) => Email(),
        PersonalInfo.routeName: (ctx) => PersonalInfo(),
        UserForm.routeName: (ctx) => UserForm(),
        CompanySelected.routName: (ctx) => CompanySelected(),
        LocationSelected.routeName: (ctx) => LocationSelected(),
        DateSelected.routeName: (ctx) => DateSelected(),
        DetailsPage.routeName: (ctx) => DetailsPage(
              dailyReportId: null,
            ),
      },
    );
  }
}
