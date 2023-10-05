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

  var kilograms,
      conversion1,
      conversion2,
      pounds,
      pound5,
      pound10,
      pound25,
      pound45,
      pound100;
  String? imagePath;

  //Bar weight = 20KG or 45LBS

  @override
  void dispose() {
    value.dispose();
    value2.dispose();
    super.dispose();
  }

  void imagePathway(double poundstemp) {
    if (poundstemp <= 5) {
      imagePath = 'assets/weight1.png';
    } else if (poundstemp <= 10) {
      imagePath = 'assets/weight2.png';
    } else if (poundstemp <= 25) {
      imagePath = 'assets/weight3.png';
    } else if (poundstemp <= 45) {
      imagePath = 'assets/weight4.png';
    } else if (poundstemp <= 100) {
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
                              value2.text = converterTools
                                  .convert1(value, conversion1, pounds)
                                  .toStringAsFixed(3);
                              if (value == "") {
                                value2.clear();
                              }
                              pounds = double.parse(value);
                              imagePathway(pounds);
                            });
                          },
                          onEditingComplete: () {
                            if (value.text.isEmpty) {
                              value2.clear();
                            }
                            pounds = double.parse(value.text);
                            imagePathway(pounds);
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
                                pounds = double.parse(value.text);
                                imagePathway(pounds);
                              });
                            },
                            onEditingComplete: () {
                              if (value2.text.isEmpty) {
                                value.clear();
                              }
                              pounds = double.parse(value.text);
                              imagePathway(pounds);
                            })),
                    SizedBox(height: 50),
                    if (imagePath != null)
                      Expanded(child: Image.asset(imagePath!)),
                    Container(
                      width: 250,
                      height: 25,
                      color: Colors.grey,
                    ),
                    //print('$imagePath');
                  ],
                ),
              )),
            )));
  }
}
