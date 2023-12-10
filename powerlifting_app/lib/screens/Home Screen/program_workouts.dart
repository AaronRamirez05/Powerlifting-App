import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';
import 'package:powerlifting_app/screens/Home%20Screen/create_program_screen.dart';
import 'package:powerlifting_app/utils/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:powerlifting_app/utils/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:powerlifting_app/screens/Home Screen/program_workouts.dart';
import 'package:powerlifting_app/utils/workouts.dart';

class ViewProgramScreen extends StatefulWidget {
  String? argument;
  ViewProgramScreen(this.argument);
  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ViewProgramScreen> {
  List<Workouts>? workouts; //all workouts
  List<Workouts> workoutsMon = [];
  List<Workouts> workoutsTues = [];
  List<Workouts> workoutsWed = [];
  List<Workouts> workoutsThurs = [];
  List<Workouts> workoutsFri = [];
  List<Workouts> workoutsSat = [];
  List<Workouts> workoutsSun = [];

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    workouts = await RemoteService().getWorkouts(
        FirebaseAuth.instance.currentUser?.uid, widget.argument.toString());

    if (workouts != null) {
      setState(() {
        isLoaded = true;
        for (var workout in workouts!) {
          if (workout.Day == 1) {
            workoutsMon.add(workout);
          } else if (workout.Day == 2) {
            workoutsTues.add(workout);
          } else if (workout.Day == 3) {
            workoutsWed.add(workout);
          } else if (workout.Day == 4) {
            workoutsThurs.add(workout);
          } else if (workout.Day == 5) {
            workoutsFri.add(workout);
          } else if (workout.Day == 6) {
            workoutsSat.add(workout);
          } else if (workout.Day == 7) {
            workoutsSun.add(workout);
          }
        }
      });
    } else {
      print(workouts);
    }
  }

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homeScreen()));
              },
            )),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.argument.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, minimumSize: Size(50, 30)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProgramScreen(
                                widget.argument.toString())));
                  },
                  child: Wrap(
                    children: <Widget>[
                      Text("Insert Workout",
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ],
                  ),
                )
              ]),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                      width: 70,
                      height: 36,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text("Monday",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              SizedBox(height: 20),
              createWorkoutsTable(workoutsMon),
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                      width: 72,
                      height: 36,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text("Tuesday",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              SizedBox(height: 20),
              createWorkoutsTable(workoutsTues),
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                      width: 92,
                      height: 36,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text("Wednesday",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              SizedBox(height: 20),
              createWorkoutsTable(workoutsWed),
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                      width: 80,
                      height: 36,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text("Thursday",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              SizedBox(height: 20),
              createWorkoutsTable(workoutsThurs),
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                      width: 60,
                      height: 36,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text("Friday",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              SizedBox(height: 20),
              createWorkoutsTable(workoutsFri),
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                      width: 78,
                      height: 36,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text("Saturday",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              SizedBox(height: 20),
              createWorkoutsTable(workoutsSat),
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                      width: 68,
                      height: 36,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text("Sunday",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              SizedBox(height: 20),
              createWorkoutsTable(workoutsSun),
              SizedBox(height: 30)
            ])));
  }
}

SingleChildScrollView createWorkoutsTable(List<Workouts> workouts) {
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.red),
          columns: [
            DataColumn(
                label: Expanded(
                    child: Text('Workout',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)))),
            DataColumn(
                label: Expanded(
                    child: Text('Week 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)))),
            DataColumn(
                label: Expanded(
                    child: Text('Week 2',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)))),
            DataColumn(
                label: Expanded(
                    child: Text('Week 3',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)))),
            DataColumn(
                label: Expanded(
                    child: Text('Week 4',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))))
          ],
          rows: workouts
              .map((w) => DataRow(
                      selected: true,
                      color: MaterialStateColor.resolveWith(
                          (states) => Colors.white10),
                      cells: [
                        DataCell(Text(w.WorkoutName.toString(),
                            style: TextStyle(color: Colors.white))),
                        DataCell(Text(w.SRRWeek1.toString(),
                            style: TextStyle(color: Colors.white))),
                        DataCell(Text(w.SRRWeek2.toString(),
                            style: TextStyle(color: Colors.white))),
                        DataCell(Text(w.SRRWeek3.toString(),
                            style: TextStyle(color: Colors.white))),
                        DataCell(Text(w.SRRWeek4.toString(),
                            style: TextStyle(color: Colors.white)))
                      ]))
              .toList()));
}
