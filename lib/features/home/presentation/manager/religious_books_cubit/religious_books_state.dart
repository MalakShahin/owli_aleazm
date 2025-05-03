part of 'religious_books_cubit.dart';

@immutable
sealed class ReligiousBooksState {}

final class ReligiousBooksInitial extends ReligiousBooksState {}
final class ReligiousBooksLoading extends ReligiousBooksState {}
final class ReligiousBooksSuccess extends ReligiousBooksState {
  final List<ReligiousBooks> religiousBooksList;

  ReligiousBooksSuccess(this.religiousBooksList);
}
final class ReligiousBooksFailure extends ReligiousBooksState {
  final String errMessage;

  ReligiousBooksFailure(this.errMessage);
}
