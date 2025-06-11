class Habit {
  final String id;
  final String name;
  final List<DateTime> completedDates;

  Habit({
    required this.id,
    required this.name,
    List<DateTime>? completedDates,
  }) : completedDates = completedDates ?? [];

  Habit copyWith({
    String? name,
    List<DateTime>? completedDates,
  }) {
    return Habit(
      id: id,
      name: name ?? this.name,
      completedDates: completedDates ?? this.completedDates,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'completedDates': completedDates.map((e) => e.toIso8601String()).toList(),
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'],
      name: json['name'],
      completedDates: (json['completedDates'] as List)
          .map((e) => DateTime.parse(e))
          .toList(),
    );
  }
}
