import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../providers/habit_provider.dart';
import '../models/habit.dart';

class HabitDetailScreen extends StatefulWidget {
  final String habitId;

  const HabitDetailScreen({super.key, required this.habitId});

  @override
  State<HabitDetailScreen> createState() => _HabitDetailScreenState();
}

class _HabitDetailScreenState extends State<HabitDetailScreen> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HabitProvider>();
    final habit = provider.getById(widget.habitId);

    return Scaffold(
      appBar: AppBar(title: Text(habit.name)),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2000),
            lastDay: DateTime.utc(2100),
            calendarFormat: CalendarFormat.month,
            selectedDayPredicate: (day) => provider.isCompleted(habit.id, day),
            onDaySelected: (selectedDay, focusedDay) {
              provider.toggleCompletion(habit.id, selectedDay);
              setState(() => _focusedDay = focusedDay);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Realizações:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          _buildStats(habit),
        ],
      ),
    );
  }

  Widget _buildStats(Habit habit) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    int countSince(DateTime from) => habit.completedDates
        .where((d) => d.isAfter(from.subtract(const Duration(days: 1))))
        .length;

    final lastWeek = countSince(today.subtract(const Duration(days: 7)));
    final lastMonth =
        countSince(DateTime(today.year, today.month - 1, today.day));
    final lastYear =
        countSince(DateTime(today.year - 1, today.month, today.day));
    final allTime = habit.completedDates.length;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Últimos 7 dias: $lastWeek"),
          Text("Último mês: $lastMonth"),
          Text("Último ano: $lastYear"),
          Text("Total: $allTime"),
        ],
      ),
    );
  }
}
