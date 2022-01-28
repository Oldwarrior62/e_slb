import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //variables for location and weather
    //tempuary hard coded in
    final String location = ('VIU');
    final String weather = ('Clear, Warm');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child:
                  //display location top left of header_info
                  //currently hard coded in
                  Text(
                'Location - $location',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child:
                  //display date top right of header_info
                  //currently hard coded in
                  Text(
                DateFormat('MMM dd, yyyy').format(DateTime.now()),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child:
                  //display weather bottom left of header_info
                  //currently hard coded in
                  Text(
                'Weather - $weather',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              //room for anouther container here
            )
          ],
        )
        //add row here if needed
      ],
    );
  }
}
