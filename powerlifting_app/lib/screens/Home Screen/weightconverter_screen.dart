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
      pounds;
  String? imagePath;
  final kilogram45 = Container(
                        color: Colors.red,
                        width: 45,
                        height: 120,
                      );
  final kilogram25 = Container(
                        color: Colors.blue,
                        width: 40,
                        height: 110,
                      );
  final kilogram15 = Container(
                        color: Colors.green,
                        width: 35,
                        height: 100,
                      );
  final kilogram10 = Container(
                        color: Colors.yellow,
                        width: 30,
                        height: 90,
                      );
  final kilogram5 = Container(
                        color: Colors.purple,
                        width: 25,
                        height: 80,
                      );
  final kilogram1 = Container(
                        color: Colors.orange,
                        width: 20,
                        height: 70,
                      );
  final kilogram05 = Container(
                        color: Colors.lightGreen,
                        width: 15,
                        height: 60,
                      );
  final kilogram025 = Container(
                        color: Colors.lightBlue,
                        width: 10,
                        height: 50,
                      );
  final kilogram01 = Container(
                        color: Colors.purpleAccent,
                        width: 5,
                        height: 40,
                      );
  List<Widget> containerWeights = [];

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
    }
  }

  //25 kg/ 20kg / 15kg / 10kg / 5kg / 2.5kg /  1.25kg / 0.5kg / 0.25kg       Barbell = 20kg    EXAMPLE: 90KG CALCULATE, subtract 20 for barbell weight, 70kg /2 for one side of barbell, 35kg
  //35kg           35 / 25  == 1    35-25 = 10
  //10kg           10 /20 == 0.xxx
  //10kg           10 /15 == 0.xxx
  //10kg           10/10 == 1       10-10 = 0

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
                              final weightsKg = converterTools
                                  .convert1(value, conversion1, pounds);
                              value2.text = weightsKg
                                  .toStringAsFixed(3);
                              if (value == "") {
                                value2.clear();
                              }
                              pounds = double.parse(value);
                              //imagePathway(pounds);
                              updateWeights(weightsKg);
                            });
                          },
                          onEditingComplete: () {
                            if (value.text.isEmpty) {
                              value2.clear();
                            }
                            pounds = double.parse(value.text);
                            //imagePathway(pounds);
                            updateWeights(pounds);
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
                                //imagePathway(pounds);
                              });
                            },
                            onEditingComplete: () {
                              if (value2.text.isEmpty) {
                                value.clear();
                              }
                              pounds = double.parse(value.text);
                              //imagePathway(pounds);
                            })),
                    SizedBox(height: 100),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                      Container(
                      width: 500,
                      height: 25,
                      color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: containerWeights
                      ),]
                    ),
                  ],
                ),
              )),
            )));
  }
  
  void updateWeights(double pounds) {
    var temp = [45, 25, 15, 10, 5, 1, 0.5, 0.25, 0.1];
    var poundsTemp = pounds;
    if (poundsTemp < 20) return;
    poundsTemp -= 20;
    containerWeights = [];
    for (var num in temp) {
      int numOfWeight = (poundsTemp / num).floor();
      for (var i = 0; i < numOfWeight; i++) {
        if (num == 45) containerWeights.add(kilogram45);
        if (num == 25) containerWeights.add(kilogram25);
        if (num == 15) containerWeights.add(kilogram15);
        if (num == 10) containerWeights.add(kilogram10);
        if (num == 5) containerWeights.add(kilogram5);
        if (num == 1) containerWeights.add(kilogram1);
        if (num == 0.5) containerWeights.add(kilogram05);
        if (num == 0.25) containerWeights.add(kilogram025);
        if (num == 0.1) containerWeights.add(kilogram01);
      }
      poundsTemp -= numOfWeight * num;
      if (poundsTemp < 0.1) return;
    }
  }
}
