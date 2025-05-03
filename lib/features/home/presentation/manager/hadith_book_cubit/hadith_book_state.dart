part of 'hadith_book_cubit.dart';

@immutable
sealed class HadithBookState {}

final class HadithBookInitial extends HadithBookState {}
final class HadithBookLoading extends HadithBookState {}
final class HadithBookSuccess extends HadithBookState {
  final List<Book> book;

  HadithBookSuccess(this.book);
}
final class HadithBookFailure extends HadithBookState {
  final String errMessage;

  HadithBookFailure(this.errMessage);
}
