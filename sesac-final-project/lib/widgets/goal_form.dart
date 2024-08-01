// lib/widgets/goal_form.dart
import 'package:flutter/material.dart';
import '../models/goal_model.dart'; // Ensure this import matches your file structure

class GoalForm extends StatefulWidget {
  @override
  _GoalFormState createState() => _GoalFormState();
}

class _GoalFormState extends State<GoalForm> {
  final _titleController = TextEditingController();
  final _targetAmountController = TextEditingController();
  final _currentAmountController = TextEditingController();
  DateTime _deadline = DateTime.now();

  void _submit() {
    final title = _titleController.text;
    final targetAmount = double.tryParse(_targetAmountController.text) ?? 0;
    final currentAmount = double.tryParse(_currentAmountController.text) ?? 0;

    if (title.isEmpty || targetAmount <= 0 || currentAmount < 0) {
      return; // Or show some error message
    }

    Navigator.of(context).pop(
      Goal(
        id: DateTime.now().toString(),
        title: title,
        targetAmount: targetAmount,
        currentAmount: currentAmount,
        deadline: _deadline,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _titleController,
          decoration: InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: _targetAmountController,
          decoration: InputDecoration(labelText: 'Target Amount'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _currentAmountController,
          decoration: InputDecoration(labelText: 'Current Amount'),
          keyboardType: TextInputType.number,
        ),
        // Date picker or other widgets
        ElevatedButton(
          onPressed: _submit,
          child: Text('Add Goal'),
        ),
      ],
    );
  }
}
