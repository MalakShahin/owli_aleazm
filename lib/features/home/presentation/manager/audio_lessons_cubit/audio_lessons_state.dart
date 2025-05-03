part of 'audio_lessons_cubit.dart';

@immutable
sealed class AudioLessonsState {}

final class AudioLessonsInitial extends AudioLessonsState {}
final class AudioLessonsLoading extends AudioLessonsState {}
final class AudioLessonsSuccess extends AudioLessonsState {
  final List<AudioItem> audioLessonsList;

  AudioLessonsSuccess(this.audioLessonsList);
}
final class AudioLessonsFailure extends AudioLessonsState {
  final String errMessage;

  AudioLessonsFailure(this.errMessage);
}
