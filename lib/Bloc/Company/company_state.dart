// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_complete_guide/models/company_model.dart';

class CompanyState extends Equatable {
  Company? company;
  CompanyState({this.company});
  @override
  List<Object?> get props => [company];

  CompanyState copywith({Company? company}) {
    return CompanyState(company: company ?? this.company);
  }
}
