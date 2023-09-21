import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';

class ConvertScreen extends StatefulWidget {
  @override
  _Convert createState() => _Convert();
}

class _Convert extends State<ConvertScreen> {
  final TextEditingController value = TextEditingController();
  var kilograms, conversion;

  void pounds() {
    setState(() {
      kilograms = int.parse(value.text);
      conversion = kilograms * 2.20462;
    });
  }

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
                    "Weight Converter",
                    style: TextStyle(color: Colors.red, fontFamily: 'Open'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    color: Colors.white,
                    height: 50,
                    width: 200,
                    child: TextField(
                        controller: value,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter the weight in pounds'))
                ),
                SizedBox(height: 50),
                Container(
                    color: Colors.white,
                    height: 50,
                    width: 200,
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'The weight in kilograms'),
                        onChanged: (text) {
                          print('($conversion) kg');
                        },)
                ),
              ],
            ),
          )),
        ));
  }
}
