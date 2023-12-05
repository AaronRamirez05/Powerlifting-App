import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_app/Common/common_widgets/custom_button.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';
import '../../../Common/common_widgets/custom_text_fields.dart';
import '../../../Common/common_widgets/validator.dart';
import '../../../utils/Utils.dart';

class CreateProgramScreen extends StatefulWidget {
  String programName;
  CreateProgramScreen(this.programName);

  @override
  _CreateProgram createState() => _CreateProgram();
}

class _CreateProgram extends State<CreateProgramScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController dayOfWeekController = TextEditingController();
  TextEditingController workoutNameController = TextEditingController();
  TextEditingController srrWeek1Controller = TextEditingController();
  TextEditingController srrWeek2Controller = TextEditingController();
  TextEditingController srrWeek3Controller = TextEditingController();
  TextEditingController srrWeek4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.red,
              iconSize: 35,
              key: Key('back-cups'),
              onPressed: () {
                FocusManager.instance.primaryFocus!.unfocus();
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Colors.black,
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Create New Program",
                      style: TextStyle(
                          color: Colors.red, fontFamily: 'Open', fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Day of Week",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 40),
                      Container(
                          color: Colors.white,
                          height: 30,
                          width: 160,
                          child: TextField(
                            controller: dayOfWeekController,
                            //keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 0.0),
                                ),
                                hintText: 'Enter Day of Week'),
                          )),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Workout Name",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 40),
                      Container(
                          color: Colors.white,
                          height: 30,
                          width: 160,
                          child: TextField(
                            controller: workoutNameController,
                            //keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 0.0),
                                ),
                                hintText: 'Enter Workout Name'),
                          )),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Week 1",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 40),
                      Container(
                          color: Colors.white,
                          height: 30,
                          width: 158,
                          child: TextField(
                            controller: srrWeek1Controller,
                            //keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 0.0),
                                ),
                                hintText: 'Enter Workout Name'),
                          )),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Week 2",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 40),
                      Container(
                          color: Colors.white,
                          height: 30,
                          width: 158,
                          child: TextField(
                            controller: srrWeek2Controller,
                            //keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 0.0),
                                ),
                                hintText: 'Set-Rep-RPE'),
                          )),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Week 3",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 40),
                      Container(
                          color: Colors.white,
                          height: 30,
                          width: 158,
                          child: TextField(
                            controller: srrWeek3Controller,
                            //keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 0.0),
                                ),
                                hintText: 'Set-Rep-RPE'),
                          )),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Week 4",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 40),
                      Container(
                          color: Colors.white,
                          height: 30,
                          width: 158,
                          child: TextField(
                            controller: srrWeek4Controller,
                            //keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 0.0),
                                ),
                                hintText: 'Set-Rep-RPE'),
                          )),
                    ],
                  ),
                  SizedBox(height: 80),
                  SizedBox(
                    width: 220,
                    height: 80,
                    child: ElevatedButton(
                      child: Text('Add Workout'),
                      onPressed: () {
                        RemoteService().createWorkout(
                            FirebaseAuth.instance.currentUser?.uid,
                            dayOfWeekController.text,
                            workoutNameController.text,
                            srrWeek1Controller.text,
                            srrWeek2Controller.text,
                            srrWeek3Controller.text,
                            srrWeek4Controller.text,
                            widget.programName);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ))
          // */
          ),
    );
  }
}

/* const List<String> daysOfWeek = <String>[
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

String dayOfWeek = "";

class DaysofWeekMenu extends StatefulWidget {
  @override
  State<DaysofWeekMenu> createState() => _DaysofWeekMenu();
}

class _DaysofWeekMenu extends State<DaysofWeekMenu> {
  String dropdownValue = daysOfWeek.first;
  String selectedCommunity = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text("Day of Week", key: Key('day-of-week-text')),
      value: null,
      //icon: const Icon(Icons.water, color: Color(0xFFFF9E80)),
      elevation: 16,
      style: const TextStyle(color: Colors.red),
      underline: Container(
        height: 2,
        color: Colors.red,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          dayOfWeek = dropdownValue;
        });
      },
      items: daysOfWeek.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
} */
