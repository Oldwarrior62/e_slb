import 'package:flutter/material.dart';
import 'details_page.dart';

class CompanySelected extends StatelessWidget {
  const CompanySelected({Key key}) : super(key: key);
  static const routName = '/company';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Container(
          child: Text('Company Selected'),
        )),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(DetailsPage.routeName),
          child: Container(
            child: Text('Create New User'),
          ),
        ),
      ],
    );
  }
}
