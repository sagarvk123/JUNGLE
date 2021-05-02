import 'package:flash_chat/alumniList.dart';
import 'package:flash_chat/profile.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(),
//       home: WelcomePage(),
//     );
//   }
// }

class WelcomePage extends StatefulWidget {
  static const String r5 = 'WelcomePage';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          "JUNGLE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text("Learn To Survive",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "images/unnamed.png",
              width: 200,
              height: 200,
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Profile.r6);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 70,
                    width: 300,
                    alignment: Alignment.center,
                    child: Column(
                      verticalDirection: VerticalDirection.down,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_box,
                          size: 30,
                          color: Colors.pink[700],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Be a Mentee",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 70,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.book,
                              size: 30,
                              color: Colors.yellowAccent[700],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Mentors",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AlumniList.r12);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 70,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.people,
                              size: 30,
                              color: Colors.orangeAccent[700],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Alumini",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
