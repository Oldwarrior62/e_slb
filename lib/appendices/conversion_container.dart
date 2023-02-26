import 'package:flutter/material.dart';

class ConversionContainer extends StatelessWidget {
  const ConversionContainer({Key? key, required this.conversionText})
      : super(key: key);
  final String conversionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 1,
          ),
          right: BorderSide(
            width: 1,
          ),
          bottom: BorderSide(
            width: 1,
          ),
        ),
      ),
      child: Text(conversionText),
    );
  }
}
