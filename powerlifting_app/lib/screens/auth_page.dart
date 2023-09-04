import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/home_screen.dart';
import 'package:powerlifting_app/screens/login_screen.dart';
import 'package:powerlifting_app/screens/signup_screen.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(onClickedSignUp: toggle)
      : SignUpScreen(onClickedSignUp: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
