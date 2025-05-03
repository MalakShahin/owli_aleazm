part of 'hadith_cubit.dart';

@immutable
sealed class HadithState {}

final class HadithInitial extends HadithState {}
final class HadithLoading extends HadithState {}
final class HadithSuccess extends HadithState {
  final List<Hadith> hadithList;

  HadithSuccess(this.hadithList);
}
final class HadithFailure extends HadithState {
  final String errMessage;

  HadithFailure(this.errMessage);
}
