import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/hadith_repo/hadith_repo.dart';

import '../../../data/models/hadith_book.dart';

part 'hadith_book_state.dart';

class HadithBookCubit extends Cubit<HadithBookState> {
  HadithBookCubit(this.hadithRepo) : super(HadithBookInitial());
  final HadithRepo hadithRepo;

  Future<void> fetchHadithBook() async {
    emit(HadithBookLoading());
    var result = await hadithRepo.fetchHadithBooks();
    result.fold(
      (failure) {
        emit(HadithBookFailure(failure.errMessage)); // Emitting failure if any
      },
      (hadithBook) {
        if (hadithBook.isEmpty) {
          emit(HadithBookFailure("No data available"));
        } else {
          emit(HadithBookSuccess(
              hadithBook)); // Emitting success with the valid list
        }
      },
    );
  }
}
