// ignore_for_file: equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/Bloc/Company/company_cubit.dart';
import 'package:flutter_complete_guide/Bloc/Notes/notesCubit.dart';
import 'package:flutter_complete_guide/Bloc/User/userCubit.dart';
import 'package:flutter_complete_guide/widgets/updateProfile.dart';
import 'package:flutter_complete_guide/widgets/add_company.dart';
import 'package:flutter_complete_guide/widgets/view_notes.dart';

import '../widgets/details_page.dart';
import './widgets/main_log_entry.dart';
import 'widgets/user_form.dart';
import 'widgets/LoginForm.dart';

//import 'widgets/main_log_entry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => UserCubit())),
        BlocProvider(
          create: ((context) => CompanyCubit()),
        ),
        BlocProvider(
          create: ((context) => NotesCubit()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-SLB',
        theme: ThemeData(
            // fontFamily: 'OpenDyslexic',
            // textTheme: ThemeData.light().textTheme.copyWith(
            //       subtitle1: TextStyle(
            //         fontFamily: 'OpenSans',
            //         fontWeight: FontWeight.bold,
            //         fontSize: 18,
            //       ),
            //       button: TextStyle(color: Colors.white),
            //     ),
            // appBarTheme: AppBarTheme(
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
          '/': (ctx) => LoginForm(),
          '/log_in': (ctx) => LoginForm(),
          MainLogEntry.routeName: (ctx) => MainLogEntry(),
          UserForm.routeName: (ctx) => UserForm(),
          DetailsPage.routeName: (ctx) => DetailsPage(
                dailyReportId: null, // null or ?
              ),
          AddCompanyScreen.routeName: ((context) => AddCompanyScreen()),
          UpdateProfile.routeName: ((context) => UpdateProfile()),
          ViewNotes.routeName: ((context) => ViewNotes())
        },
      ),
    );
  }
}
