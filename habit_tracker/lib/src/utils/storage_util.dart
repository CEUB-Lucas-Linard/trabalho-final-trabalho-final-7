import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/habit.dart';

class StorageUtil {
  static const _key = 'habits';

  static Future<void> saveHabits(List<Habit> habits) async {
    final prefs = await SharedPreferences.getInstance();
    final list = habits.map((h) => h.toJson()).toList();
    await prefs.setString(_key, jsonEncode(list));
  }

  static Future<List<Habit>> loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];
    final List data = jsonDecode(jsonString);
    return data.map((e) => Habit.fromJson(e)).toList();
  }
}
