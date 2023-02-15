// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_complete_guide/models/UserModel.dart';

class UserState extends Equatable {
  @override
  List<Object?> get props => [userModel, islisence];

  UserModel? userModel;
  bool islisence;

  UserState({this.userModel, required this.islisence});

  UserState copywith({UserModel? userModel, bool? islisence}) {
    return UserState(
        userModel: userModel ?? this.userModel,
        islisence: islisence ?? this.islisence);
  }
}
