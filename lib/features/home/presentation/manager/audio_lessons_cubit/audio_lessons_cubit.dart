
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/audio_lessons.dart';
import '../../../data/repos/audio_lessons_repo/audio_lessons_repo.dart';

part 'audio_lessons_state.dart';

class AudioLessonsCubit extends Cubit<AudioLessonsState> {
  AudioLessonsCubit(this.audioLessonsRepo) : super(AudioLessonsInitial());
  AudioLessonsRepo audioLessonsRepo;

  Future<void> fetchLessonsList() async {
    emit(AudioLessonsLoading());
    var result = await audioLessonsRepo.fetchLessonsList();
    result.fold(
          (failure) {
        emit(AudioLessonsFailure(failure.errMessage)); // Emitting failure if any
      },
          (audioLessonsList) {
        if (audioLessonsList.isEmpty) {
          emit(AudioLessonsFailure("No data available"));
        } else {
          emit(AudioLessonsSuccess(
              audioLessonsList)); // Emitting success with the valid list
        }
      },
    );
  }
}
