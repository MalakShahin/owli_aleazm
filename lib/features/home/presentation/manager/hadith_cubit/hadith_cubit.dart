import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/hadith_book.dart';
import '../../../data/repos/hadith_repo/hadith_repo.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit(this.hadithRepo) : super(HadithInitial());
  final HadithRepo hadithRepo;

  Future<void> fetchHadith(String bookId) async {
    emit(HadithLoading());
    var result = await hadithRepo.fetchHadith(bookId);
    result.fold(
      (failure) {
        emit(HadithFailure(failure.errMessage)); // Emitting failure if any
      },
      (hadith) {
        if (hadith.isEmpty) {
          emit(HadithFailure("No data available"));
        } else {
          emit(HadithSuccess(hadith));
        }
      },
    );
  }
}
