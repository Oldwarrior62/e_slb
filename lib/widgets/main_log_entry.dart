import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  bool _showHeader = false;

  String date = DateFormat.yMMMMd().format(DateTime.now());

  void _newLogEntry(String newLogEntry) {
    final newLogIn = ReportInformation(
      reportInformationId: DateTime.now().toString(),
      logEntry: newLogEntry,
      createdTime: DateTime.now(),
    );
    setState(() {
      _report.add(newLogIn);
    });
  }

  void _startNewLogEntry(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewLogEntry(_newLogEntry);
      },
    );
  }

  void stikeOutLogEntry(String id) {
    setState(() {
      _report.removeWhere(
        (log) => log.reportInformationId == id,
      );
    });
  }

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
                child: HeaderInfo(),
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
                0.2,
            width: mediaQuery.size.width * 0.95,
            child: HeaderInfo(),
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
    final PreferredSizeWidget appBar = Platform.isIOS
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
          );

    final logWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.75,
      child: LogInfoList(_report, stikeOutLogEntry),
    );

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
                appBar,
                logWidget,
              ),
            if (!isLandScape)
              ..._buildPortrateContent(
                mediaQuery,
                appBar,
                logWidget,
              ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            //appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _startNewLogEntry(context),
            ),
          );
  }
}
