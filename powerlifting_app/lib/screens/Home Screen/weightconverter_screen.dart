import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';

class ConvertScreen extends StatefulWidget {
  @override
  _Convert createState() => _Convert();
}

class _Convert extends State<ConvertScreen> {
  TextEditingController value = TextEditingController();
  TextEditingController value2 = TextEditingController();
  var kilograms, conversion1, conversion2, pounds, pound5, pound10, pound25, pound45, pound100;
  String? imagePath;

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

  void imagePathway() {
    if (pounds <= 5) {
      imagePath = 'assets/weight1.png';
    } else if (pounds <= 10) {
      imagePath = 'assets/weight2.png';
    } else if (pounds <= 25) {
      imagePath = 'assets/weight3.png';
    } else if (pounds <= 45) {
      imagePath = 'assets/weight4.png';
    } else if (pounds <= 100) {
      imagePath = 'assets/weight5.png';
    } else {
      imagePath = 'assets/weight5.png';

      //pound100 = pounds / 100;
      //pound45 = pounds % 100 / 45;
      //pound25 = pounds % 100 % 45 / 25;
      //pound10 = pounds % 100 % 45 % 25 / 10;
      //pound5 = pounds % 100 % 45 % 25 % 10 / 5;
      //for (int i = 0; i < pound45; i++) {
        //Expanded(child: Image.asset('assets/weight4.png'));
      //} for (int i = 0; i < pound25; i++) {
        //Expanded(child: Image.asset('assets/weight3.png'));
      //} for (int i = 0; i < pound10; i++) {
        //Expanded(child: Image.asset('assets/weight2.png'));
      //} for (int i = 0; i < pound5; i++) {
        //Expanded(child: Image.asset('assets/weight1.png'));
      //}
    }
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
                              imagePathway();
                            });
                          },
                          onEditingComplete: () {
                            if (value.text.isEmpty) {
                              value2.clear();
                            }
                            imagePathway();
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
                                imagePathway();
                              });
                            },
                            onEditingComplete: () {
                              if (value2.text.isEmpty) {
                                value.clear();
                              }
                              imagePathway();
                            })),
                    SizedBox(height: 50),
                    if (imagePath != null)
                      Expanded(child: Image.asset(imagePath!)),
                    //print('$imagePath');
                  ],
                ),
              )),
            )));
  }
}
