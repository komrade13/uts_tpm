import 'package:flutter/material.dart';

import 'geometry_page.dart';
import 'calendar_page.dart';
import 'profile_page.dart';
import 'login_page.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Geometry Calculator'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GeometryPage()));
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Calendar'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalendarPage()));
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Profile'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}