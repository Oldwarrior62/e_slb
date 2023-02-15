import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/Bloc/Company/company_state.dart';
import 'package:flutter_complete_guide/models/company_model.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyState());

  setCompany(Company company) {
    emit(state.copywith(company: company));
  }
}
