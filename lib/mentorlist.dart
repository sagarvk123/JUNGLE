import 'package:flash_chat/mentor1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/sidebar.dart';
import 'package:flash_chat/contactus.dart';
import 'package:flash_chat/mentorlist.dart';
import 'package:flash_chat/aboutus.dart';
import 'package:flash_chat/alumniList.dart';

class MentorList extends StatefulWidget {
  static const String r8 = 'MentorList';
  @override
  _MentorListState createState() => _MentorListState();
}

class _MentorListState extends State<MentorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          "MentorList",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
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
                  Navigator.pushNamed(context, Mentor1.r7);
                },
                child: Text(
                  'Mentor1',
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
                  Navigator.pushNamed(context, Mentor1.r7);
                },
                child: Text(
                  'Mentor2',
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
                  Navigator.pushNamed(context, Mentor1.r7);
                },
                child: Text(
                  'Mentor3',
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
