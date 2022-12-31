final String companyTable = 'company';

class CompanyNotes {
  static final List<String> values = [
    companyId,
    companyName,
    companyEmail,
  ];
  static final String companyId = 'companyId';
  static final String companyName = 'companyName';
  static final String companyEmail = 'companyEmail';
}

class Company {
  int companyId;
  String companyName;
  String companyEmail;

  Company({
    this.companyId,
    this.companyName,
    this.companyEmail,
  });

  Company.fromMap(dynamic obj) {
    this.companyEmail = obj['companyEmail'];
    this.companyId = obj['companyId'];
    this.companyName = obj['comapnyName'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'companyEmail': companyEmail,
      'companyId': companyId,
      'comapnyName': companyName,
    };
    return map;
  }
}
