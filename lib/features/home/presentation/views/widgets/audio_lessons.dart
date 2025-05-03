


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/error_state.dart';
import '../../../../../core/widgets/loading_state.dart';
import '../../manager/audio_lessons_cubit/audio_lessons_cubit.dart';
import 'lesson_list.dart';

class AudioLessons extends StatelessWidget {
  const AudioLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioLessonsCubit, AudioLessonsState>(
      builder: (context, state) {
        if (state is AudioLessonsSuccess) {
          return LessonList(
            lessonsList: state.audioLessonsList,
            isAudio: true,
          );
        } else if (state is AudioLessonsFailure) {
          return ErrorState(errMessage: state.errMessage);
        }
        return const LoadingState();
      },
    );
  }
}
