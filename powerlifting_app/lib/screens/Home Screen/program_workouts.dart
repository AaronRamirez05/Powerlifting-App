import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/programs_screen.dart';
import 'package:powerlifting_app/utils/Utils.dart';

class ProgramWorkouts extends StatefulWidget {
  final String? argument;
  ProgramWorkouts({required this.argument});

  @override
  _ProgramWorkouts createState() =>
      _ProgramWorkouts(argument: argument.toString());
}

class _ProgramWorkouts extends State<ProgramWorkouts> {
  TextEditingController emailupData = TextEditingController();
  final String argument;
  _ProgramWorkouts({required this.argument});
  String Day = "";

  @override
  void dispose() {
    emailupData.dispose();
    super.dispose();
  }

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
                  MaterialPageRoute(builder: (context) => ProgramScreen()));
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
                    argument,
                    style: TextStyle(color: Colors.red, fontFamily: 'Open'),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Container(
                        width: 525,
                        height: 525,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: 7,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, int index) {
                              Day = PrintProgram().getDay(index);
                              return ListTile(
                                title: Container(
                                  child: Column(children: <Widget>[
                                    Text(
                                      Day,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'Open'),
                                    ),
                                  ]),
                                ),
                              );
                            })),
                  ),
                )
              ],
            ),
          )),
        ));
  }
}
