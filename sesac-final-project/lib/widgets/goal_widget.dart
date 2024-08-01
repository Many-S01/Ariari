import 'package:flutter/material.dart';
import '../models/goal_model.dart'; // Ensure this import matches your file structure

class GoalWidget extends StatelessWidget {
  final Goal goal;

  GoalWidget({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(goal.title),
        subtitle: Text(
          'Target: ${goal.targetAmount.toString()} - Deadline: ${goal.deadline.toLocal().toString().split(' ')[0]}',
        ),
        trailing: Text(
          'Current: ${goal.currentAmount.toString()}',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
