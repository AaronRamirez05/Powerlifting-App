import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/home_screen.dart';
import 'package:powerlifting_app/screens/signupinfo.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController emailinData = TextEditingController();
  TextEditingController passinData = TextEditingController();
  String emailtext = '';
  String passtext = '';
  bool interacts = false;

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
                Container(
                  child: Text(
                    "Email",
                    style: TextStyle(color: Colors.red, fontFamily: 'Open'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    height: 46,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextField(
                      style: TextStyle(fontSize: 14, fontFamily: 'Open'),
                      key: Key("emailin-field"),
                      controller: emailinData,
                      onChanged: (value) {
                        setState(() {
                          if (emailinData.text != "" && passinData.text != "")
                            interacts = true;
                          else
                            interacts = false;
                        });
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    )),
                Container(
                  child: Text(
                    "Password",
                    style: TextStyle(color: Colors.red, fontFamily: 'Open'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    height: 46,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextField(
                      style: TextStyle(fontSize: 14, fontFamily: 'Open'),
                      key: Key("passin-field"),
                      controller: passinData,
                      onChanged: (value) {
                        setState(() {
                          if (passinData.text != "" && emailinData.text != "")
                            interacts = true;
                          else
                            interacts = false;
                        });
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    )),
                SizedBox(
                  height: 35,
                ),
                Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextButton(
                        onPressed: (!interacts) ? null : signIn,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: (interacts) ? Colors.white : Colors.black,
                              fontFamily: 'Open'),
                        ))),
                SizedBox(
                  height: 5,
                ),
                Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupInfo()));
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Open',
                          ),
                        ))),
              ],
            ),
          )),
        ));
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailinData.text.trim(), password: passinData.text.trim());
  }
}
