import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';

class ConvertScreen extends StatefulWidget {
  @override
  _Convert createState() => _Convert();
}

class _Convert extends State<ConvertScreen> {
  TextEditingController value = TextEditingController();
  TextEditingController value2 = TextEditingController();
  var kilograms, conversion1, conversion2, pounds;

  void convert1(String inputvalue) {
    setState(() {
      pounds = double.tryParse(inputvalue);
      conversion1 = pounds / 2.20462;
      value2.text = conversion1.toStringAsFixed(3);
    });
  }

  void convert2(String inputvalue) {
    setState(() {
      kilograms = double.tryParse(inputvalue);
      conversion2 = kilograms * 2.20462;
      value.text = conversion2.toStringAsFixed(3);
    });
  }

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
                              convert1(value);
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
                                convert2(value2);
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
