import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/error_state.dart';
import '../../../../../core/widgets/loading_state.dart';
import 'lesson_list.dart';

import '../../manager/religion_lessons_cubit/religion_lessons_cubit.dart';

//  Build VideoLessonsSection
class VideoLessonsSection extends StatelessWidget {
  const VideoLessonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReligionLessonsCubit, ReligionLessonsState>(
      builder: (context, state) {
        if (state is ReligionLessonsSuccess) {
          return LessonList(
            lessonsList: state.lessonsList,
            isAudio: false,
          );
        } else if (state is ReligionLessonsFailure) {
          return ErrorState(errMessage: state.errMessage);
        }
        return const LoadingState();
      },
    );
  }
}

