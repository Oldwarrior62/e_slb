import 'package:flutter/material.dart';

import '../DatabaseHandler/DbHelper.dart';
import '../models/company_model.dart';
import '../models/location_model.dart';
import '../models/daily_report_model.dart';
import '../models/user_model.dart';
import '../widgets/main_drawer.dart';

class DetailsPage extends StatefulWidget {
  final int? dailyReportId;

  const DetailsPage({Key? key, required this.dailyReportId}) : super(key: key);
  static const routeName = '/detailsPage';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late DailyReport dailyReport;
  late User user;
  late Location location;
  late Company company;
  bool isLoading = false;

  Future refreshDailyReports() async {
    setState(() => isLoading = true);
    this.dailyReport =
        await DbHelper.instance.readDailyReport(widget.dailyReportId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Report Details'),
      ),
      drawer: MainDrawer(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(12),
              child: ListView(
                padding: EdgeInsets.all(12),
                children: [
                  Text(
                    user.name!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    user.surname!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    company.companyName!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    location.location!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    dailyReport.dayCreated.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    dailyReport.notes!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    dailyReport.weather!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
    );
  }
}
