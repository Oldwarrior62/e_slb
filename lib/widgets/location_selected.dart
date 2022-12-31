import 'package:flutter/material.dart';
import 'details_page.dart';

class LocationSelected extends StatelessWidget {
  const LocationSelected({Key key}) : super(key: key);
  static const routeName = '/location';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Container(
          child: Text('Location Selected'),
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
