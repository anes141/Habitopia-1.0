class Habit {
  final String id;
  final String title;
  final String description;
  final List<DateTime> completedDates;

  Habit({
    required this.id,
    required this.title,
    required this.description,
    List<DateTime>? completedDates,
  }) : completedDates = completedDates ?? [];

  bool isCompletedToday() {
    final today = DateTime.now();
    return completedDates.any((date) =>
        date.year == today.year &&
        date.month == today.month &&
        date.day == today.day);
  }
}