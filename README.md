# e_slb

NAME: SECURE LOG

This is a stand a lone app for security guards.
Simmular to a notes app but with our protocals.
This verion is for one user only.

fields only createed once and never updated
-name 
-surname

Fields that are updated randomly by user
-Company
-Location preffer its updated with package:location/location.dart.
-Weather preffer its updated with location package:weather/weather.dart.
- Logo

Fields that are added to daily report every day
-Location preffer its updated with package:location/location.dart.
-Weather preffer its updated with location package:weather/weather.dart.
-createdDate

Fields that are added to daily report several times a day // add or update?
-createdTime
-logEntry


TODOS:
-connect user form to upload information to the database. //new_user and user_form are the same.
-connect log entry and time created to database.
-create and connect update page.
-add a signature widget.
-be able to email a txt or pdf in a email.
-search by dateCreated, Company, Location, keyWord.
-add the free dyslixec font options.
-add is twentyfour hours option set as default.
-add dark mode?
-add is logged in (user created).
-figgure out what to do with update header?
-add a expandable notes area between header and manin body of log entry
-page numbered
-make it international


ERRORS:
-report_information_operations lines 23-24. // map((reportInformation) =>
            ReportInformation.fromMap(ReportInformationOperations()))
        .toList(); //should be ReportInformation not ReportInformationOperations()

-main line 60 //DetailsPage.routeName: (ctx) => DetailsPage(dailyReportId: null, // which should it be null or ?


Need explained:
-how does foriegn keys work together when creating a input?
-how do I display 'daily report' with 'company' and 'location' in the details page name and surname never change.
-useing widget or this  not sure of the differance
-using = or :  not sure of the differance
-and more

SOURCES I used.

SQFlite:
https://www.youtube.com/watch?v=lLqPIulkQYg
source code https://github.com/jurkko/sqflitetutorial2/tree/a6c97bf4f0d1e3b491873b4be0562e6bd0f0964f
https://www.youtube.com/watch?v=UpKrhZ0Hppk
source code https://github.com/JohannesMilke/sqflite_database_example

Flutter/Dart:
https://www.udemy.com/


My background.
ITAS diploma information technology and applied systems 20 years ago havent followed up in the field due to being dyslixec.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
