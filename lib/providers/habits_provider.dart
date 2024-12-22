import 'package:flutter/foundation.dart';
import '../models/habit.dart';

class HabitsProvider extends ChangeNotifier {
  final List<Habit> _habits = [];

  List<Habit> get habits => [..._habits];

  void addHabit(String title, String description) {
    final habit = Habit(
      id: DateTime.now().toString(),
      title: title,
      description: description,
    );
    _habits.add(habit);
    notifyListeners();
  }

  void deleteHabit(String id) {
    _habits.removeWhere((habit) => habit.id == id);
    notifyListeners();
  }

  void toggleHabitCompletion(String id) {
    final habitIndex = _habits.indexWhere((habit) => habit.id == id);
    if (habitIndex >= 0) {
      final today = DateTime.now();
      final habit = _habits[habitIndex];
      
      if (habit.isCompletedToday()) {
        habit.completedDates.removeWhere((date) =>
            date.year == today.year &&
            date.month == today.month &&
            date.day == today.day);
      } else {
        habit.completedDates.add(today);
      }
      notifyListeners();
    }
  }
}