import 'package:flutter/material.dart';

loading(BuildContext context) {
  return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            content: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Loading...")
                ],
              ),
            ),
          )));
}
