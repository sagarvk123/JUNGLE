import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutusPage extends StatefulWidget {
  static const String r10 = 'AboutusPage';
  @override
  _AboutusPageState createState() => _AboutusPageState();
}

class _AboutusPageState extends State<AboutusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("About Us ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/about.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              "JUNGLE : Tinder For Education."
              "New to a field or interest in any field ,but don't know how to start or confused from the classic way of searching from Internet."
              "Leave that - our specialised mentors are there for you to guide in the field they love the most and u will also fell in love."
              "Come Join us.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  height: 1.2,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
