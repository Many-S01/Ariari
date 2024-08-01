import 'package:flutter/material.dart';
import '../widgets/goal_widget.dart'; // widgets 폴더 내 goal_widget.dart
import '../models/goal_model.dart'; // models 폴더 내 goal_model.dart
import 'chat_screen.dart'; // screens 폴더 내 chat_screen.dart
import 'goal_screen.dart'; // screens 폴더 내 goal_screen.dart
import 'profile_screen.dart'; // screens 폴더 내 profile_screen.dart
import 'study_screen.dart'; // screens 폴더 내 study_screen.dart

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Goal sampleGoal = Goal(
      id: '1',
      title: '여행 저축',
      targetAmount: 1000000,
      currentAmount: 500000,
      deadline: DateTime(2023, 12, 31),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FWealth'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home', style: Theme.of(context).textTheme.headline6), // 수정됨
              SizedBox(height: 16),
              Text('GOAL', style: Theme.of(context).textTheme.subtitle1), // 수정됨
              GoalWidget(goal: sampleGoal),
            ],
          ),
        ),
      ),
    );
  }
}
