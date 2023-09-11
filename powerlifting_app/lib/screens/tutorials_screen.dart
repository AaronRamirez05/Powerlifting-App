import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/home_screen.dart';

class TutorialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutorial Screen',
      home: Scaffold(
        appBar: AppBar(title: Text('Tutorial Screen'),),
        body: Center(
          child: TextButton(
            child: Text('Return To Home Screen'),
            //style: TextStyle(color: Colors.white, fontFamily: 'Open'),
            onPressed: (){
              Navigator.pop(context);
            })
        )
      )
    )
  }
}