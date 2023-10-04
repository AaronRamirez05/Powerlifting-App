import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';
import 'package:powerlifting_app/utils/Utils.dart';

class ConvertScreen extends StatefulWidget {
  @override
  _Convert createState() => _Convert();
}

class _Convert extends State<ConvertScreen> {
  converterTools tools = new converterTools();
  TextEditingController value = TextEditingController();
  TextEditingController value2 = TextEditingController();
  double kilograms = 0;
  double conversion1 = 0;
  double conversion2 = 0;
  double pounds = 0;

  @override
  void dispose() {
    value.dispose();
    value2.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
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
                        key: Key('convertcheck'),
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
                            setState(() {
                              value2.text = converterTools
                                  .convert1(value, conversion1, pounds)
                                  .toStringAsFixed(3);
                              if (value == "") {
                                value2.clear();
                              }
                            });
                          },
                          onEditingComplete: () {
                            if (value.text.isEmpty) {
                              value2.clear();
                            }
                          },
                        )),
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
                              setState(() {
                                value.text = converterTools
                                    .convert2(value2, conversion2, kilograms)
                                    .toStringAsFixed(3);
                                if (value2 == "") {
                                  value.clear();
                                }
                              });
                            },
                            onEditingComplete: () {
                              if (value2.text.isEmpty) {
                                value.clear();
                              }
                            })),
                    SizedBox(height: 50),
                    Container(
                        child: CustomPaint(
                      foregroundPainter: WeightPainter(),
                    ))
                  ],
                ),
              )),
            )));
  }
}

class WeightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final weight = Paint()
      ..strokeWidth = 20
      ..color = Colors.red;

    canvas.drawLine(
      Offset(size.width * 1 / 2, size.height * 1 / 6),
      Offset(size.width * 1 / 2, size.height * 2 / 3),
      weight,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
