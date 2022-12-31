import 'package:flutter/foundation.dart';

//tempory used untill I connect create user

class UserInformation {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime expiryDate;
  final String imageUrl;
  final String companyName;
  final String siteLocation;

  UserInformation({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.expiryDate,
    @required this.imageUrl,
    @required this.companyName,
    @required this.siteLocation,
  });
}
