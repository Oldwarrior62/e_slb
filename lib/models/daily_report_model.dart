final String dailyReportTable = 'dailyReport';

class DailyReportNotes {
  static final List<String> values = [
    dailyReportId,
    log,
    timeCreated,
    notes,
    signature,
    weather,
    dayCreated,
    company,
    location,
    reportInformation,
  ];
  static final String dailyReportId = 'dailyReportId';
  static final String log = 'log';
  static final String timeCreated = 'timeCreated';
  static final String notes = 'notes';
  static final String signature = 'signature';
  static final String weather = 'weather';
  static final String dayCreated = 'dayCreated';
  static final String company = 'company';
  static final String location = 'location';
  static final String reportInformation = 'reportInformation';
}

class DailyReport {
  int? dailyReportId;
  String? log;
  DateTime? timeCreated;
  String? notes;
  String? signature;
  String? weather;
  DateTime? dayCreated;
  int? company;
  int? location;
  int? reportInformation;

  DailyReport(
    this.dailyReportId,
    this.log,
    this.timeCreated,
    this.notes,
    this.signature,
    this.weather,
    this.dayCreated,
    this.company,
    this.location,
    this.reportInformation,
  );

  DailyReport.fromMap(dynamic obj) {
    this.dailyReportId = obj['dailyReportId'];
    this.log = obj['log'];
    this.timeCreated = obj['timeCreated'];
    this.dayCreated = obj['dayCreated'];
    this.notes = obj['notes'];
    this.signature = obj['signature'];
    this.weather = obj['weather'];
    this.company = obj['comany'];
    this.location = obj['location'];
    this.reportInformation = obj['reportInfo'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'dayCreated': dayCreated,
      'notes': notes,
      'log': log,
      'timeCreated': timeCreated,
      'signature': signature,
      'weather': weather,
      'comany': company,
      'location': location,
      'reportInfo': reportInformation,
    };
    return map;
  }
}
