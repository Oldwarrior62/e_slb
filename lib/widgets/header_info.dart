import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/update_page.dart';
//import 'package:flutter/services.dart';
//import 'package:geolocator/geolocator.dart';

class HeaderInfo extends StatefulWidget {
  // final locationController = TextEditingController();
  // final weatherController = TextEditingController();
  @override
  State<HeaderInfo> createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  // final Geolocator geolocator = Geolocator();

  // Position userLocation;

  final String date = DateFormat.yMMMMd().format(DateTime.now());

  final String weather = 'Sunny 14c';

  final String location = 'VIU';

  @override
  Widget build(BuildContext context) {
    // final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Column(
      children: [
        //     currentLocation = await geolocator.getCurrentPosition(
        // desiredAccuracy: LocationAccuracy.best);

        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Location: ${location}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14 //* curScaleFactor,
                    ),
              ),
              //display for current year month day is submitted
              Text(
                date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12, //* curScaleFactor,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child:
                  //display weather bottom left of header_info
                  //currently hard coded in
                  Text(
                'Weather: ${weather}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(UpdatePage.routeName),
            icon: Icon(Icons.update))
      ],
    );
  }
}
