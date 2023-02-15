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
  String? timeCreated;
  String? notes;
  String? signature;
  String? weather;
  String? dateCreated;
  String? company;
  String? location;
  int? reportInformation;
  String? logo;

  DailyReport(
      this.dailyReportId,
      this.log,
      this.timeCreated,
      this.notes,
      this.signature,
      this.weather,
      this.dateCreated,
      this.company,
      this.location,
      this.reportInformation,
      this.logo);

  DailyReport.fromMap(dynamic obj) {
    this.dailyReportId = obj['dailyReportId'];
    this.log = obj['log'];
    this.timeCreated = obj['timeCreated'];
    this.dateCreated = obj['dateCreated'];
    this.notes = obj['notes'];
    this.signature = obj['signature'];
    this.weather = obj['weather'];
    this.company = obj['companyName'];
    this.location = obj['location'];
    this.logo = obj['logo'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'dateCreated': dateCreated,
      'notes': notes,
      'log': log,
      'timeCreated': timeCreated,
      'signature': signature,
      'weather': weather,
      'companyName': company,
      'location': location,
      'logo': logo
    };
    return map;
  }
}
