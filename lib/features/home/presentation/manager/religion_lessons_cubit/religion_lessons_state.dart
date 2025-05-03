part of 'religion_lessons_cubit.dart';

@immutable
sealed class ReligionLessonsState {}

final class ReligionLessonsInitial extends ReligionLessonsState {}

final class ReligionLessonsLoading extends ReligionLessonsState {}

final class ReligionLessonsSuccess extends ReligionLessonsState {
  final List<VideoItem> lessonsList;

  ReligionLessonsSuccess(this.lessonsList);
}

final class ReligionLessonsFailure extends ReligionLessonsState {
  final String errMessage;

  ReligionLessonsFailure(this.errMessage);
}
