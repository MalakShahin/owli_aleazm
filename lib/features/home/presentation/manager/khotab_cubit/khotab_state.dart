part of 'khotab_cubit.dart';

@immutable
sealed class KhotabState {}

final class KhotabInitial extends KhotabState {}
final class KhotabLoading extends KhotabState {}
final class KhotabSuccess extends KhotabState {
  final List<Khotab> khotabList;

  KhotabSuccess(this.khotabList);
}
final class KhotabFailure extends KhotabState {
  final String errMessage;

  KhotabFailure(this.errMessage);
}
