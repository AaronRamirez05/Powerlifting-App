import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';
import 'package:powerlifting_app/utils/Utils.dart';

class ProgramScreen extends StatefulWidget {
  @override
  _Program createState() => _Program();
}

class _Program extends State<ProgramScreen> {
  // ProgramData ProgramList = new ProgramData();
  String buttonTest = 'Test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.red,
            iconSize: 35,
            key: Key('back-cups'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => homeScreen()));
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: Container(
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Programs",
                    key: Key('programcheck'),
                    style: TextStyle(color: Colors.red, fontFamily: 'Open'),
                  ),
                ),
                TextButton(
                    child: Text(buttonTest),
                    onPressed: () async {
                      ProgramData.showData();
                    }),
              ],
            ),
          )),
        ));
  }
}
