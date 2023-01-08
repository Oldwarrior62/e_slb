final String companyTable = 'company';

class CompanyNotes {
  static final List<String> values = [
    companyId,
    companyName,
    companyEmail,
    logoUrl,
  ];
  static final String companyId = 'companyId';
  static final String companyName = 'companyName';
  static final String companyEmail = 'companyEmail';
  static final String logoUrl = 'logoUrl';
}

class Company {
  int? companyId;
  String? companyName;
  String? companyEmail;
  String? logoUrl;

  Company({
    this.companyId,
    this.companyName,
    this.companyEmail,
    this.logoUrl,
  });

  Company.fromMap(dynamic obj) {
    this.companyEmail = obj['companyEmail'];
    this.companyId = obj['companyId'];
    this.companyName = obj['comapnyName'];
    this.logoUrl = obj['logoUrl'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'companyEmail': companyEmail,
      'companyId': companyId,
      'comapnyName': companyName,
      'logoUrl': logoUrl,
    };
    return map;
  }
}
