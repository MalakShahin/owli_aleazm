part of 'religious_book_details_cubit.dart';

@immutable
sealed class ReligiousBookDetailsState {}

final class ReligiousBookDetailsInitial extends ReligiousBookDetailsState {}
final class ReligiousBookDetailsLoading extends ReligiousBookDetailsState {}
final class ReligiousBookDetailsSuccess extends ReligiousBookDetailsState {
  final ReligiousBooks religiousBookDetails;

  ReligiousBookDetailsSuccess(this.religiousBookDetails);
}
final class ReligiousBookDetailsFailure extends ReligiousBookDetailsState {
  final String errMessage;

  ReligiousBookDetailsFailure(this.errMessage);
}
