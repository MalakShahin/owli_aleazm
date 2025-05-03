part of 'quran_progress_cubit.dart';

@immutable
sealed class QuranProgressState {}

final class QuranProgressInitial extends QuranProgressState {}

class QuranProgressUpdated extends QuranProgressState {
  final String surahName;
  final int ayahNumber;

  QuranProgressUpdated(this.surahName, this.ayahNumber);
}
