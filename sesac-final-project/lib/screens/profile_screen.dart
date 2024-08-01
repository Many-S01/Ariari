// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import '../models/goal_model.dart'; // Ensure this import matches your file structure
import '../widgets/goal_widget.dart'; // Ensure this import matches your file structure
import '../widgets/goal_form.dart'; // Ensure this import matches your file structure

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Goal> _goals = []; // To hold the list of goals

  void _addGoal() async {
    final newGoal = await showDialog<Goal>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Goal'),
          content: GoalForm(), // Make sure you have a GoalForm widget defined
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                // Logic to create a new goal and pass it back
                // Example:
                Navigator.of(context).pop(Goal(
                  id: 'new_id',
                  title: 'New Goal',
                  targetAmount: 0.0,
                  currentAmount: 0.0,
                  deadline: DateTime.now(),
                ));
              },
            ),
          ],
        );
      },
    );

    if (newGoal != null) {
      setState(() {
        _goals.add(newGoal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
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
