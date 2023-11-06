import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:powerlifting_app/Common/common_widgets/custom_button.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';

import '../../Common/common_widgets/custom_text_fields.dart';
import '../../Common/common_widgets/validator.dart';
import '../../utils/Utils.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Account createState() => Account();
}

class Account extends State<AccountScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final oldController = TextEditingController();
  bool isLoading = false;
  bool passObscure=true;
  bool passObscure2=true;

  final formKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;
@override
  void initState() {
emailController.text=user.email!;
super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    oldController.dispose();
    super.dispose();
  }

  update() async {
    FocusManager.instance.primaryFocus!.unfocus();
    if (formKey.currentState!.validate()) {
    setState(() {
        isLoading = true;
      });
      bool success = await updateEmailAndPassword(
          currentPassword: oldController.text.trim(),
          newPassword: passController.text.trim(),
          email: emailController.text.trim());

      setState(() {
        isLoading = false;
      });
      if(success){
        Utils.showToast(msg: "Email and Password Updated successfully");
      }

    }
  }

  Future<bool> updateEmailAndPassword(
      {required String currentPassword,
      required String newPassword,
      required String email}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      var user = _auth.currentUser!;
      var credentials = EmailAuthProvider.credential(
          email: _auth.currentUser!.email!, password: currentPassword);
      await user.reauthenticateWithCredential(credentials);
      await _auth.currentUser!.updatePassword(newPassword);
      await _auth.currentUser!.updateEmail(email);
      return true;
    } on FirebaseAuthException catch (e, stackTrace) {
      Utils.showSnackBar(e.message);
      return false;
    } catch (e, stackTrace) {
      Utils.showSnackBar(e.toString());
      return false;
    }
  }

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
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
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
                          height: 15,
                        ),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Enter Email',
                          label: 'Email Address',
                          validatorFn: emailValidator,
                        ),
                        CustomTextField(
                          controller: oldController,
                          hintText: 'Enter old password',
                          label: 'Old Password',
                          validatorFn: sectionValidator,
                          obscure: passObscure,
                          tailingIcon: passObscure == false
                              ? InkWell(
                              onTap: () {
                                setState(() {
                                  passObscure = !passObscure;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.eye,
                                color:Colors.black45,
                                size: 20,
                              ))
                              : InkWell(
                              onTap: () {
                                setState(() {
                                  passObscure = !passObscure;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.eye_slash,
                                color:Colors.black,
                                size: 20,
                              )),
                        ),
                        CustomTextField(
                          controller: passController,
                          hintText: 'Enter new password',
                          label: 'New Password',
                          validatorFn: passValidator,
                          obscure: passObscure2,
                          tailingIcon: passObscure2 == false
                              ? InkWell(
                              onTap: () {
                                setState(() {
                                  passObscure2 = !passObscure2;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.eye,
                                color:Colors.black45,
                                size: 20,
                              ))
                              : InkWell(
                              onTap: () {
                                setState(() {
                                  passObscure2= !passObscure2;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.eye_slash,
                                color:Colors.black,
                                size: 20,
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          onPressed: update,
                          buttonText: "Update",
                          buttonWidth: 200,
                          isLoading: isLoading,
                          backColor: Colors.red,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))),
    );
  }
}
