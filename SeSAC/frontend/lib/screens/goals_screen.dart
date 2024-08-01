import 'package:flutter/material.dart';
import '../models/economic_goal.dart';
import '../services/api_service.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  List<EconomicGoal> goals = [];
  final TextEditingController _goalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    final loadedGoals = await ApiService.getEconomicGoals();
    setState(() {
      goals = loadedGoals;
    });
  }

  Future<void> _addGoal() async {
    if (_goalController.text.isNotEmpty) {
      final newGoal = await ApiService.setEconomicGoal(_goalController.text);
      setState(() {
        goals.add(newGoal);
        _goalController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('경제 목표')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _goalController,
                    decoration: const InputDecoration(
                      hintText: '새로운 경제 목표를 입력하세요',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addGoal,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: goals.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(goals[index].description),
                  trailing: Checkbox(
                    value: goals[index].isCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        goals[index].isCompleted = value ?? false;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}