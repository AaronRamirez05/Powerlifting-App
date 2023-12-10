import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';
import 'package:powerlifting_app/screens/Home%20Screen/create_program_screen.dart';
import 'package:powerlifting_app/screens/Home%20Screen/programs_screen.dart';
import 'package:powerlifting_app/utils/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:powerlifting_app/utils/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:powerlifting_app/screens/Home Screen/program_workouts.dart';

class CreateProgramScreen extends StatefulWidget {
  String programName;
  CreateProgramScreen(this.programName);
  @override
  _CreateProgramScreenState createState() => _CreateProgramScreenState();
}

class _CreateProgramScreenState extends State<CreateProgramScreen> {
  TextEditingController workoutName = TextEditingController();
  TextEditingController srrWeek1 = TextEditingController();
  TextEditingController srrWeek2 = TextEditingController();
  TextEditingController srrWeek3 = TextEditingController();
  TextEditingController srrWeek4 = TextEditingController();

  //dropdown first value
  String dropdownvalue = 'Monday';

  //items in dropdown
  var daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    // resizeToAvoidBottomPadding:
    // false;
    // resizeToAvoidBottomInset:
    // false;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          toolbarHeight: 80,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.red,
            iconSize: 35,
            key: Key('back-cups'),
            onPressed: () {
              FocusManager.instance.primaryFocus!.unfocus();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ViewProgramScreen(widget.programName.toString())));
              //Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Program Screen",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("Create 4 Week Program",
                  style: TextStyle(
                      color: Colors.white24, fontStyle: FontStyle.italic)),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 45),
                  Text("Select Day of Week",
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 19)),
                  SizedBox(width: 40),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: DropdownButtonHideUnderline(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(canvasColor: Colors.white10),
                        child: DropdownButton(
                          style: TextStyle(color: Colors.red),
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.red),
                          // Array list of items
                          items: daysOfWeek.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(children: [
                SizedBox(width: 20),
                Container(
                    width: 80,
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(" Exercise",
                        style: TextStyle(color: Colors.white))),
                SizedBox(width: 40),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: workoutName,
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      labelText: 'Enter exercise',
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ]),
              SizedBox(height: 20),
              Row(children: [
                SizedBox(width: 20),
                Container(
                    width: 80,
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child:
                        Text(" Week 1", style: TextStyle(color: Colors.white))),
                SizedBox(width: 40),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: srrWeek1,
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      labelText: 'Enter Set-Rep-RPE',
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ]),
              SizedBox(height: 20),
              Row(children: [
                SizedBox(width: 20),
                Container(
                    width: 80,
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child:
                        Text(" Week 2", style: TextStyle(color: Colors.white))),
                SizedBox(width: 40),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: srrWeek2,
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      labelText: 'Enter Set-Rep-RPE',
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ]),
              SizedBox(height: 20),
              Row(children: [
                SizedBox(width: 20),
                Container(
                    width: 80,
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child:
                        Text(" Week 3", style: TextStyle(color: Colors.white))),
                SizedBox(width: 40),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: srrWeek3,
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      labelText: 'Enter Set-Rep-RPE',
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ]),
              SizedBox(height: 20),
              Row(children: [
                SizedBox(width: 20),
                Container(
                    width: 80,
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child:
                        Text(" Week 4", style: TextStyle(color: Colors.white))),
                SizedBox(width: 40),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: srrWeek4,
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      labelText: 'Enter Set-Rep-RPE',
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ]),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, minimumSize: Size(50, 30)),
                    onPressed: () {
                      RemoteService().createWorkout(
                          FirebaseAuth.instance.currentUser?.uid,
                          dropdownvalue,
                          workoutName.text,
                          srrWeek1.text,
                          srrWeek2.text,
                          srrWeek3.text,
                          srrWeek4.text,
                          widget.programName);
                    },
                    child: Wrap(
                      children: <Widget>[
                        Text("Add to Program",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30)
            ])));
  }
}
