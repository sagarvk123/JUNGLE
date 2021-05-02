import 'package:flash_chat/Alumni/alumni1.dart';
import 'package:flash_chat/aboutus.dart';
import 'package:flash_chat/alumniList.dart';
import 'package:flash_chat/compare.dart';
import 'package:flash_chat/contactus.dart';
import 'package:flash_chat/mentor1.dart';
import 'package:flash_chat/mentorlist.dart';
import 'package:flash_chat/profile.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';

import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/check.dart';

//import 'screens/welcome_screen.dart';
//import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: WelcomeScreen.r1,
      routes: {
        WelcomeScreen.r1: (context) => WelcomeScreen(),
        RegistrationScreen.r2: (context) => RegistrationScreen(),
        LoginScreen.r3: (context) => LoginScreen(),
        ChatScreen.r4: (context) => ChatScreen(),
        WelcomePage.r5: (context) => WelcomePage(),
        Profile.r6: (context) => Profile(),
        Mentor1.r7: (context) => Mentor1(),
        MentorList.r8: (context) => MentorList(),
        MyApp.r9: (context) => MyApp(),
        AboutusPage.r10: (context) => AboutusPage(),
        ContactusPage.r11: (context) => ContactusPage(),
        AlumniList.r12: (context) => AlumniList(),
        Alumni1.r13: (context) => Alumni1(),
      },
//      home: WelcomeScreen(),
    );
  }
}
