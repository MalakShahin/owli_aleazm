part of 'surah_list_cubit.dart';

@immutable
sealed class SurahListState {}

final class SurahListInitial extends SurahListState {}
final class SurahListLoading extends SurahListState {}
final class SurahListSuccess extends SurahListState {
  final List<Surah> surah;

  SurahListSuccess(this.surah);
}
final class SurahListFailure extends SurahListState {
  final String errMessage;

  SurahListFailure(this.errMessage);
}



