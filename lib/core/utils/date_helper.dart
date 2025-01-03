import 'package:intl/intl.dart';

class DateHelper {
  static String toYear(String releaseDate) {
    if (releaseDate.isEmpty) {
      return 'Unknown release date';
    }
    try {
      final parsedDate = DateTime.parse(releaseDate);
      return parsedDate.year.toString();
    } catch (e) {
      return 'Invalid release date';
    }
  }

  static String formatRuntime(int runtime) {
    final hours = runtime ~/ 60; // Hitung jam
    final minutes = runtime % 60; // Sisa menit
    return '$hours h $minutes min';
  }

  static String formatNormalDate(String releaseDate) {
    if (releaseDate.isEmpty) {
      return 'Unknown release date';
    }
    try {
      final parsedDate = DateTime.parse(releaseDate);
      // Format tanggal ke "4 Oktober 2021"
      return DateFormat('d MMMM yyyy').format(parsedDate);
    } catch (e) {
      return 'Invalid release date';
    }
  }

  static String age(String? birthday) {
    try {
      final birthDate = DateTime.parse(birthday ?? '');
      final currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;

      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }

      return '$age years old';
    } catch (e) {
      return 'Invalid date format';
    }
  }
}
