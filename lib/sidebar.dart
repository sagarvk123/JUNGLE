import 'package:flash_chat/aboutus.dart';
import 'package:flash_chat/alumniList.dart';
import 'package:flash_chat/compare.dart';
import 'package:flash_chat/mentorlist.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/contactus.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Dhruv'),
            accountEmail: Text('vengergupta@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://www.fedex.com/content/dam/fedex/us-united-states/shipping/images/2020/Q2/account_purple_icon_1988286190.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Percentage'),
            onTap: () {
              Navigator.pushNamed(context, MyApp.r9);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mentors'),
            onTap: () {
              Navigator.pushNamed(context, MentorList.r8);
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('About Us'),
            onTap: () => Navigator.pushNamed(context, AboutusPage.r10),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.pushNamed(context, ContactusPage.r11);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Alumni'),
            onTap: () => Navigator.pushNamed(context, AlumniList.r12),
          ),
        ],
      ),
    );
  }
}
