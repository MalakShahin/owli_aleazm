import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/surah_repo/surah_repo.dart';

import '../../../data/models/surah_number.dart';

part 'surah_list_state.dart';

class SurahListCubit extends Cubit<SurahListState> {
  SurahListCubit(this.surahRepo) : super(SurahListInitial());

  final SurahRepo surahRepo;

  Future<void> fetchSurahList() async {
    emit(SurahListLoading());
    var result = await surahRepo.fetchSurahList();
    result.fold(
      (failure) {
        emit(SurahListFailure(failure.errMessage)); // Emitting failure if any
      },
      (surahList) {
        if (surahList.isEmpty) {
          emit(SurahListFailure("No data available"));
        } else {
          emit(SurahListSuccess(
              surahList)); // Emitting success with the valid list
        }
      },
    );
  }
}
