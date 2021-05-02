import 'package:flash_chat/check.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flash_chat/check.dart';

class LoginScreen extends StatefulWidget {
  static const String r3 = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
        opacity: 0.5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 280.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                style: TextStyle(color: Colors.blue),
                decoration: kTextFieldDecoration,
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                style: TextStyle(color: Colors.blue),
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                onpressed: () async {
                  setState(() {
                    _saving = true;
                  });
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    if (userCredential != null) {
                      Navigator.pushNamed(context, WelcomePage.r5);
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    _saving = false;
                  });
                },
                color: Colors.lightBlueAccent,
                text: 'Log In',
              ),
//            Padding(
//              padding: EdgeInsets.symmetric(vertical: 16.0),
//              child: Material(
//                color: ,
//                borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                elevation: 5.0,
//                child: MaterialButton(
//                  onPressed: () {
//                    //Implement login functionality.
//                  },
//                  minWidth: 200.0,
//                  height: 42.0,
//                  child: Text(
//                    'Log In',
//                  ),
//                ),
//              ),
//            ),
            ],
          ),
        ),
      ),
    );
  }
}
