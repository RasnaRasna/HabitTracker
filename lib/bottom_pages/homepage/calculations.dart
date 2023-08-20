int calculateCurrentStreak(List<Map<String, dynamic>> habitHistory) {
  int currentStreak = 0;
  int longestStreak = 0;

  for (final data in habitHistory) {
    final completionDate = data['completionDate'] as DateTime?;
    if (completionDate != null) {
      currentStreak++;
      longestStreak =
          currentStreak > longestStreak ? currentStreak : longestStreak;
    } else {
      currentStreak = 0;
    }
  }

  return longestStreak;
}

double calculateCompletionPercentage(List<Map<String, dynamic>> habitHistory) {
  final completedDays =
      habitHistory.where((data) => data['isSelected'] == true).length;
  final totalDays = habitHistory.length;

  return (completedDays / totalDays) * 100;
}

int calculateCompletedWeeks(List<Map<String, dynamic>> habitHistory) {
  // Calculate the number of weeks based on habit start date
  final startDate = habitHistory.isNotEmpty
      ? habitHistory.first['startDate'].toDate()
      : DateTime.now();
  final endDate = DateTime.now();
  final daysDifference = endDate.difference(startDate).inDays;

  final completedDays =
      habitHistory.where((data) => data['isSelected'] == true).length;

  final completedWeeks = (completedDays / 7).ceil();

  return completedWeeks;
}

int calculateTotalWeeks(List<Map<String, dynamic>> habitHistory) {
  // Calculate the number of weeks based on habit start date
  final startDate = habitHistory.isNotEmpty
      ? habitHistory.first['startDate'].toDate()
      : DateTime.now();
  final endDate = DateTime.now();
  final daysDifference = endDate.difference(startDate).inDays;

  final totalWeeks = (daysDifference / 7).ceil();

  return totalWeeks;
}

double calculateDaysCompletionPercentage(
    List<Map<String, dynamic>> habitHistory) {
  final completedDays =
      habitHistory.where((data) => data['isSelected'] == true).length;
  final totalDays = habitHistory.length;

  return (completedDays / totalDays) * 100;
}

int calculateCompletedDays(List<Map<String, dynamic>> habitHistory) {
  return habitHistory.where((data) => data['isSelected'] == true).length;
}

int calculateTotalDays(List<Map<String, dynamic>> habitHistory) {
  return habitHistory.length;
}
