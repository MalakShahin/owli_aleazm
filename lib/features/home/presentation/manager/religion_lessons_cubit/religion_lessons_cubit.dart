

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/religion_lessons.dart';
import '../../../data/repos/religion_lessons_repo/religion_lessons_repo.dart';

part 'religion_lessons_state.dart';

class ReligionLessonsCubit extends Cubit<ReligionLessonsState> {
  ReligionLessonsCubit(this.religionLessonsRepo) : super(ReligionLessonsInitial());
  ReligionLessonsRepo religionLessonsRepo;

  Future<void> fetchLessonsList() async {
    emit(ReligionLessonsLoading());
    var result = await religionLessonsRepo.fetchLessonsList();
    result.fold(
          (failure) {
        emit(ReligionLessonsFailure(failure.errMessage)); // Emitting failure if any
      },
          (lessonsList) {
        if (lessonsList.isEmpty) {
          emit(ReligionLessonsFailure("No data available"));
        } else {
          emit(ReligionLessonsSuccess(
              lessonsList)); // Emitting success with the valid list
        }
      },
    );
  }
}
