import 'package:flutter/material.dart';

class StudyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'FWealth Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text('Goal'),
              onTap: () {
                Navigator.pushNamed(context, '/goal');
              },
            ),
            ListTile(
              title: Text('Chat'),
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text('Study'),
              onTap: () {
                Navigator.pushNamed(context, '/study');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Study Screen'),
      ),
    );
  }
}
