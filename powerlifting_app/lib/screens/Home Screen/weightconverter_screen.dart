import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';

class ConvertScreen extends StatefulWidget {
  @override
  _Convert createState() => _Convert();
}

class _Convert extends State<ConvertScreen> {
  final TextEditingController value = TextEditingController();
  final TextEditingController value2 = TextEditingController();
  var kilograms, conversion, pounds;

  void convert1(value) {
    setState(() {
      kilograms = int.parse(value.text);
      conversion = kilograms * 2.20462;
    });
  }

  void convert2(value2) {
    setState(() {
      pounds = int.parse(value2.text);
      conversion = pounds / 2.20462;
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
                    key:Key('convertcheck'),
                    style: TextStyle(color: Colors.red, fontFamily: 'Open'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    color: Colors.white,
                    height: 50,
                    width: 200,
                    child: TextFormField(
                        controller: value,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter the weight in pounds'),
                        onChanged: (value) {
                          convert1(value);
                        },)
                ),
                SizedBox(height: 50),
                Container(
                    color: Colors.white,
                    height: 50,
                    width: 200,
                    child: TextFormField(
                        controller: value2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter the weight in kilograms'),
                        onChanged: (value2) {
                          convert2(value2);
                        })
                ),
                SizedBox(height: 50),
                Container(
                  child: CustomPaint(
                    foregroundPainter: WeightPainter(),
                  )
                )
              ],
            ),
          )),
        ));
  }
}

class WeightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final weight = Paint()..strokeWidth = 20..color = Colors.red;

    canvas.drawLine(
      Offset(size.width * 1/2, size.height * 1/6),
      Offset(size.width * 1/2, size.height * 2/3),
      weight,
      );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}