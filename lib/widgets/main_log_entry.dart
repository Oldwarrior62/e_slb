import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/Bloc/Company/company_cubit.dart';
import 'package:flutter_complete_guide/Comm/commHelper.dart';
import 'package:flutter_complete_guide/models/daily_report_model.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import 'package:intl/intl.dart';

import '../DatabaseHandler/DbHelper.dart';
import '../models/company_model.dart';
import 'log_info_list.dart';
import 'new_log_entry.dart';
import 'header_info.dart';
import '../models/report_model.dart';

class MainLogEntry extends StatefulWidget {
  static const routeName = '/main_log_entry';

  @override
  State<MainLogEntry> createState() => _MainLogEntryState();
}

class _MainLogEntryState extends State<MainLogEntry> {
  final List<ReportInformation> _report = [];

  final String weather = 'Sunny 14c';

  final String location = 'VIU';
  List<Company> lstcompany = [];
  List<DailyReport> lstdailyReports = [];
  bool isloading = true;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    DbHelper db = DbHelper.instance;

    await db.getAllCompany().then((value) {
      lstcompany = value;
      if (lstcompany.length > 0) {
        BlocProvider.of<CompanyCubit>(context).setCompany(lstcompany[0]);
      }
    });

    await db.getAllReports().then((value) => lstdailyReports = value);
    isloading = false;
    setState(() {});
  }

  bool _showHeader = false;

  String date = DateFormat.yMMMMd().format(DateTime.now());
  void _newLogEntry(DailyReport newReport) {
    setState(() {
      lstdailyReports.add(newReport);
    });
  }

  ListTile logEntryItem(DailyReport dailyReport, BuildContext context) {
    return ListTile(
        leading: Text(
          "${dailyReport.dateCreated.toString()}\n${dailyReport.timeCreated.toString()}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        title: Text(dailyReport.log.toString()),
        subtitle: Text(dailyReport.company ?? ""),
        trailing: IconButton(
          onPressed: () async {
            DbHelper db = DbHelper.instance;
            await db
                .deleteDailyReport(dailyReport.dailyReportId!)
                .then((value) {
              alertDialog(context, "Report Deleted..");
              lstdailyReports.remove(dailyReport);
              setState(() {});
            });
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ));
  }

// bottom modal type in your log entry
  void _startNewLogEntry(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewLogEntry(_newLogEntry,
            selectedvalue: BlocProvider.of<CompanyCubit>(context).state.company,
            lstcompany: lstcompany,
            location: location,
            weather: weather);
      },
    );
  }

// set as delete but I want to change this so it will
// put strike through the letters instead
  void stikeOutLogEntry(int id) {
    setState(() {
      lstdailyReports.removeAt(id);
    });
  }

//landscape view
  List<Widget> _buildLandscapeContent(
    MediaQueryData mediaQuery,
    AppBar appBar,
    logWidget,
  ) {
    // String weather;
    // String location;
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
// creates more room removing the header in landsacpe view
          const Text('Show header'),
          Switch.adaptive(
            activeColor: Theme.of(context).shadowColor,
            value: _showHeader,
            onChanged: (val) {
              setState(() {
                _showHeader = val;
              });
            },
          ),
        ],
      ),
      _showHeader
          ? Column(children: [
              Image.asset(
                'lib/images/logo.png',
                width: mediaQuery.size.width * .2,
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    1,
                width: mediaQuery.size.width * 0.95,
                child: HeaderInfo(
                    lstcompany: lstcompany,
                    location: location,
                    weather: weather),
              ),
              const Divider(
                height: 3,
                thickness: 2,
                color: Colors.black,
              ),
            ])
          : logWidget,
    ];
  }

// portrate view
  List<Widget> _buildPortrateContent(
    MediaQueryData mediaQuery,
    AppBar appBar,
    logWidget,
  ) {
    // String weather;
    // String location;
    return [
      Column(
        children: [
// this is hard coded for now I want to beable
//to upload url or image found on the device
          Image.asset(
            'lib/images/logo.png',
            width: mediaQuery.size.width * .2,
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            width: mediaQuery.size.width * 0.95,
            child: HeaderInfo(
                lstcompany: lstcompany, location: location, weather: weather),
          ),
          const Divider(
            height: 3,
            thickness: 2,
            color: Colors.black,
          ),
        ],
      ),
      logWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandScape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text('Security Log Book'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => _startNewLogEntry(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text('Security Log Book'),
            actions: [
              IconButton(
                onPressed: () => _startNewLogEntry(context),
                icon: Icon(Icons.add),
              ),
            ],
          )) as PreferredSizeWidget;

    // is the log entrys list with the delete icon to be turned into strike out
    final logWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.75,
      child: LogInfoList(_report, stikeOutLogEntry, lstdailyReports),
    );

    // body creates a single scrool view
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            if (isLandScape)
              ..._buildLandscapeContent(
                mediaQuery,
                appBar as AppBar,
                logWidget,
              ),
// ! is not landscape
            if (!isLandScape)
              ..._buildPortrateContent(
                mediaQuery,
                appBar as AppBar,
                logWidget,
              ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );

// is IPS
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar as ObstructingPreferredSizeWidget?,
          )
        : Scaffold(
            appBar: appBar,
            body: isloading
                ? Center(child: const CircularProgressIndicator())
                : pageBody,
            drawer: Drawer(child: MainDrawer()),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _startNewLogEntry(context),
            ),
          );
  }
}
