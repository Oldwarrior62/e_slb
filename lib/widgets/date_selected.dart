import 'package:flutter/material.dart';
import '../widgets/daily_report_card_widget.dart';
//import 'package:flutter_complete_guide/db_operations/daily_report_operations.dart';
import '../db/daily_report_database.dart';
import '../models/daily_report_model.dart';
import '../widgets/details_page.dart';

class DateSelected extends StatefulWidget {
  const DateSelected({Key? key}) : super(key: key);
  static const routeName = '/date';

  @override
  State<DateSelected> createState() => _DateSelectedState();
}

class _DateSelectedState extends State<DateSelected> {
  late List<DailyReport> dailyReports;
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    refreshDailyReport();
  }

  @override
  void dispose() {
    DailyReportRepository.instance.close();
    super.dispose();
  }

  Future refreshDailyReport() async {
    setState(() => isloading = true);
    this.dailyReports =
        // had to move getAllDailyReports to repository from operations
        await DailyReportRepository.instance.getAllDailyReports();
    setState(() => isloading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Reports'),
      ),
      body: Center(
        child: isloading
            ? CircularProgressIndicator()
            : dailyReports.isEmpty
                ? Text(
                    'No Daily Reports',
                  )
                : buildDailyReport(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => null) as Widget Function(BuildContext),
            ),
          );
          refreshDailyReport();
        },
      ),
    );
  }

  Widget buildDailyReport() => ListView.builder(
        itemCount: dailyReports.length,
        itemBuilder: (context, index) {
          final dailyReport = dailyReports[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(dailyReportId: dailyReport.dailyReportId),
                ),
              );
              refreshDailyReport();
            },
            child:
                DailyReportCardWidget(dailyReport: dailyReport, index: index),
          );
        },
      );
}
