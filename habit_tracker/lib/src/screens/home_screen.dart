import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';
import 'new_habit_screen.dart';
import 'habit_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habits = context.watch<HabitProvider>().habits;

    return Scaffold(
      appBar: AppBar(title: const Text('Seus Hábitos')),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (_, index) {
          final habit = habits[index];
          return ListTile(
            title: Text(habit.name),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HabitDetailScreen(habitId: habit.id),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NewHabitScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
