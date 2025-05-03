import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/shared_pref_helper.dart';

part 'quran_progress_state.dart';

class QuranProgressCubit extends Cubit<QuranProgressState> {
  QuranProgressCubit() : super(QuranProgressInitial());

  // Method to update the progress
  void updateProgress(String surahName, int ayahNumber) {
    emit(QuranProgressUpdated(surahName, ayahNumber));
  }

  // Method to load saved progress
  Future<void> loadProgress() async {
    final progress = await QuranProgress.loadProgress();
    if (progress != null) {
      emit(
        QuranProgressUpdated(
          progress.surahName,
          progress.ayahNumber,
        ),
      );
    } else {
      emit(QuranProgressInitial());
    }
  }

  // Method to reset progress
  void resetProgress() {
    emit(QuranProgressInitial());
  }
}
