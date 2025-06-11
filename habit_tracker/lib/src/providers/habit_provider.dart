import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../utils/storage_util.dart';

class HabitProvider with ChangeNotifier {
  final List<Habit> _habits = [];

  List<Habit> get habits => List.unmodifiable(_habits);

  void loadHabits() async {
    final loaded = await StorageUtil.loadHabits();
    _habits.clear();
    _habits.addAll(loaded);
    notifyListeners();
  }

  void addHabit(String name) {
    final habit = Habit(
      id: DateTime.now().toIso8601String(),
      name: name,
    );
    _habits.add(habit);
    _save();
  }

  void updateHabitName(String id, String newName) {
    final habit = _habits.firstWhere((h) => h.id == id);
    _updateHabit(id, habit.copyWith(name: newName));
  }

  void deleteHabit(String id) {
    _habits.removeWhere((h) => h.id == id);
    _save();
  }

  void toggleCompletion(String habitId, DateTime date) {
    final habit = _habits.firstWhere((h) => h.id == habitId);
    final dates = List<DateTime>.from(habit.completedDates);
    if (dates.any((d) => _isSameDay(d, date))) {
      dates.removeWhere((d) => _isSameDay(d, date));
    } else {
      dates.add(date);
    }
    _updateHabit(habitId, habit.copyWith(completedDates: dates));
  }

  bool isCompleted(String habitId, DateTime date) {
    final habit = _habits.firstWhere((h) => h.id == habitId);
    return habit.completedDates.any((d) => _isSameDay(d, date));
  }

  Habit getById(String id) => _habits.firstWhere((h) => h.id == id);

  void _updateHabit(String id, Habit updated) {
    final index = _habits.indexWhere((h) => h.id == id);
    _habits[index] = updated;
    _save();
  }

  void _save() {
    StorageUtil.saveHabits(_habits);
    notifyListeners();
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
