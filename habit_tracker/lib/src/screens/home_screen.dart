import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';
import 'new_habit_screen.dart';
import 'habit_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider = context.watch<HabitProvider>();
    final habits = habitProvider.habits;

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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showEditHabitDialog(context, habit.id, habit.name);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context, habit.id, habit.name);
                  },
                ),
              ],
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

  void _showEditHabitDialog(BuildContext context, String habitId, String currentName) {
    final TextEditingController controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Hábito'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Novo nome do hábito'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {
                final newName = controller.text.trim();
                if (newName.isNotEmpty) {
                  context.read<HabitProvider>().updateHabitName(habitId, newName);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String habitId, String habitName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content: Text('Tem certeza que deseja excluir o hábito "$habitName"?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Excluir'),
              onPressed: () {
                context.read<HabitProvider>().deleteHabit(habitId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
