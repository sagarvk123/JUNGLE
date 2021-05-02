import 'package:flash_chat/Alumni/alumni1.dart';
import 'package:flash_chat/mentor1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/sidebar.dart';

class AlumniList extends StatefulWidget {
  static const String r12 = 'AlumniList';
  @override
  _AlumniListState createState() => _AlumniListState();
}

class _AlumniListState extends State<AlumniList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      body: ListView(
        padding: const EdgeInsets.all(50),
        children: <Widget>[
          Container(
            height: 70,
            width: 200,
            child: Align(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Alumni1.r13);
                },
                child: Text(
                  'Alumni1',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 70,
            width: 200,
            child: Align(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Alumni1.r13);
                },
                child: Text(
                  'Alumni2',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 70,
            width: 200,
            child: Align(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Alumni1.r13);
                },
                child: Text(
                  'Alumni3',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                )),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
