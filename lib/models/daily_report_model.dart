final String dailyReportTable = 'dailyReport';

class DailyReportNotes {
  static final List<String> values = [
    dailyReportId,
    notes,
    signature,
    weather,
    dayCreated,
    companyId,
    locationId,
    reportInformationId,
  ];
  static final String dailyReportId = 'dailyReportId';
  static final String notes = 'notes';
  static final String signature = 'signature';
  static final String weather = 'weather';
  static final String dayCreated = 'dayCreated';
  static final String companyId = 'companyId';
  static final String locationId = 'locationId';
  static final String reportInformationId = 'reportInformationId';
}

class DailyReport {
  int? dailyReportId;
  String? notes;
  String? signature;
  String? weather;
  DateTime? dayCreated;
  int? companyId;
  int? locationId;
  int? reportInformationId;

  DailyReport(
    this.dailyReportId,
    this.notes,
    this.signature,
    this.weather,
    this.dayCreated,
    this.companyId,
    this.locationId,
    this.reportInformationId,
  );

  DailyReport.fromMap(dynamic obj) {
    this.dailyReportId = obj['dailyReportId'];
    this.dayCreated = obj['dayCreated'];
    this.notes = obj['notes'];
    this.signature = obj['signature'];
    this.weather = obj['weather'];
    this.companyId = obj['FK_dailyReport_comany'];
    this.locationId = obj['FK_dailyReport_location'];
    this.reportInformationId = obj['FK_dailyReport_reportInfo'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'dayCreated': dayCreated,
      'notes': notes,
      'signature': signature,
      'weather': weather,
      'FK_dailyReport_comany': companyId,
      'FK_dailyReport_location': locationId,
      'FK_dailyReport_reportInfo': reportInformationId,
    };
    return map;
  }
}
