import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';
import 'package:powerlifting_app/utils/Utils.dart';
import 'package:http/http.dart' as http;

class ProgramScreen extends StatefulWidget {
  @override
  _Program createState() => _Program();
}

class _Program extends State<ProgramScreen> {
  ProgramData temp = new ProgramData();
  bool textFieldDisplayed = false;

  @override
  void initState() {
    super.initState();
    temp.populateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              child: Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              SizedBox(width: 300),
              Container(
                width: 35,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
            ]),
            SizedBox(height: 15),
            Row(children: <Widget>[
              SizedBox(width: 85),
              Container(
                width: 200,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextField(
                  style: TextStyle(fontSize: 14, fontFamily: 'Open'),
                  key: Key("emailin-field"),
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.red,
                    size: 30,
                  )),
            ]),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.0),
              child: SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: temp.programs.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, int index) {
                    return ListTile(
                        title: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 40,
                      width: 150,
                      alignment: Alignment.center,
                      child: Row(children: <Widget>[
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.note_rounded,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          temp.programs[index],
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Open'),
                        ),
                      ]),
                    ));
                  },
                ),
              )),
            )
          ])),
        ));
  }
}
