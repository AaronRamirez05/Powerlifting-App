import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_app/Common/common_widgets/custom_button.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';
import 'package:powerlifting_app/screens/Home%20Screen/update_email_screen.dart';
import 'package:powerlifting_app/screens/Home%20Screen/update_password_screen.dart';
import '../../../Common/common_widgets/custom_text_fields.dart';
import '../../../Common/common_widgets/validator.dart';
import '../../../utils/Utils.dart';

class AccountScreen extends StatefulWidget {
  @override
  _Account createState() => _Account();
  AccountScreen({Key? key, this.input, this.input2, this.input3}) : super(key: key);
  String? input;
  String? input2;
  String? input3;
}

class _Account extends State<AccountScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController value = TextEditingController();
  TextEditingController value2 = TextEditingController();
  TextEditingController value3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus!.unfocus(),
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
          body: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "My Account",
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Open',
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Text("Current Email: ${user.email!}", style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Open',
                          fontSize: 16)),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 80),
                        Container(
                            color: Colors.white,
                            height: 50,
                            width: 150,
                            child: TextFormField(
                              controller: value,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Enter weight in LB'),
                            )),
                        SizedBox(width: 10),
                        Text("Squat",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 80),
                        Container(
                            color: Colors.white,
                            height: 50,
                            width: 150,
                            child: TextFormField(
                                controller: value2,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'Enter weight in LB'),
                            )),
                        SizedBox(width: 10), 
                        Text("Bench",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 80),
                        Container(
                            color: Colors.white,
                            height: 50,
                            width: 150,
                            child: TextFormField(
                                controller: value3,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'Enter weight in LB'),
                            )),
                        SizedBox(width: 10), 
                        Text("Deadlift",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                  SizedBox(height: 10),
                  CustomButton(
                    onPressed: () {
                      if (widget.input == "" || widget.input2 == "" || widget.input == "") {
                        widget.input = '0';
                        widget.input2 = '0';
                        widget.input3 = '0';
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => homeScreen(input: value.text = '0', input2: value2.text = '0', input3: value3.text = '0')));
                      }
                      else {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => homeScreen(input: value.text, input2: value2.text, input3: value3.text)));
                      }
                    },
                    buttonText: "Update Values",
                    buttonWidth: 200,
                    backColor: Colors.red,
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UpdateEmailScreen()));
                    },
                    buttonText: "Update Email",
                    buttonWidth: 200,
                    backColor: Colors.red,
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  UpdatePasswordScreen()));
                    },
                    buttonText: "Update Password",
                    buttonWidth: 200,
                    backColor: Colors.red,
                  ),
                ],
              ),
            ),
          ))),
    );
  } 
}
