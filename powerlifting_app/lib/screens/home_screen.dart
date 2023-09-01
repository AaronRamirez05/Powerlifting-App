import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  @override
  _home createState() => _home();
}

class _home extends State<homeScreen> {
  TextEditingController emailupData = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          )),
        ));
  }
}
