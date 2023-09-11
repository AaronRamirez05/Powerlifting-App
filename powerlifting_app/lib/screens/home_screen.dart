import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/tutorials_screen.dart';

class homeScreen extends StatefulWidget {
  @override
  _home createState() => _home();
}

class _home extends State<homeScreen> {
  TextEditingController emailupData = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(user.email!, style: TextStyle(color: Colors.red)),
                Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextButton(
                        onPressed: () => FirebaseAuth.instance.signOut(),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Open'),
                        ))),
                        SizedBox(height: 150),
                Container(
                    height: 35,
                    width: 95,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextButton(
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => tutorials_screen()));
                        },
                        child: Text(
                          'Tutorials',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Open'),
                        ))),
                        SizedBox(height: 25),
                  Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Programs',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Open'),
                        ))),
                        SizedBox(height: 25),
                  Container(
                    height: 35,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Record Sessions',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Open'),
                        ))),
                        SizedBox(height: 25),
                  Container(
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Weight Convertor',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Open'),
                        ))),
                        SizedBox(height: 25),
                  Container(
                    height: 35,
                    width: 115,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'My Account',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Open'),
                        ))),
                        SizedBox(height: 25),
                  Container(
                    height: 35,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Achievements',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Open'),
                        ))),
              ],
              
            ),
          )),
        ));
  }
}
