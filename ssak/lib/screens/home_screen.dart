import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'settings_screen.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          CustomCard(title: 'Item 1', description: 'Description 1'),
          CustomCard(title: 'Item 2', description: 'Description 2'),
          CustomCard(title: 'Item 3', description: 'Description 3'),
        ],
      ),
    );
  }
}
