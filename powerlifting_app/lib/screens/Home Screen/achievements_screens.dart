import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home%20Screen/home_screen.dart';

class AchieveScreen extends StatefulWidget {
  @override
  _Achieve createState() => _Achieve();
}

class _Achieve extends State<AchieveScreen> {

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => homeScreen()));
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
                    "Achievements",
                    key: Key('achievecheck'),
                    style: TextStyle(color: Colors.red, fontFamily: 'Open'),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}

