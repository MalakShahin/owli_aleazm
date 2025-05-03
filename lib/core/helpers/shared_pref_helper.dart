


import 'package:shared_preferences/shared_preferences.dart';

class QuranProgress {
  final String surahName;
  final int ayahNumber;

  QuranProgress({
    required this.surahName,
    required this.ayahNumber,
  });

  // Save the progress to SharedPreferences
  Future<void> saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('surahName', surahName);
    await prefs.setInt('ayahNumber', ayahNumber);
  }

  // Load the progress from SharedPreferences
  static Future<QuranProgress?> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final surahName = prefs.getString('surahName');
    final ayahNumber = prefs.getInt('ayahNumber');

    if (surahName != null && ayahNumber != null) {
      return QuranProgress(surahName: surahName, ayahNumber: ayahNumber);
    } else {
      return null;
    }
  }

  // Reset the progress
  Future<void> resetProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('surahName');
    await prefs.remove('ayahNumber');
  }
}