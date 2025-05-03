

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/khotab_model.dart';
import '../../../data/repos/khotab_repo/khotab_repo.dart';

part 'khotab_state.dart';

// khotab_cubit
// Khotab


class KhotabCubit extends Cubit<KhotabState> {
  KhotabCubit(this.khotabRepo) : super(KhotabInitial());

  KhotabRepo khotabRepo;
  Future<void> fetchKhotabList() async {
    emit(KhotabLoading());
    var result = await khotabRepo.fetchKhotabList();
    result.fold(
          (failure) {
        emit(KhotabFailure(failure.errMessage)); // Emitting failure if any
      },
          (khotabList) {
        if (khotabList.isEmpty) {
          emit(KhotabFailure("No data available"));
        } else {
          emit(KhotabSuccess(
              khotabList)); // Emitting success with the valid list
        }
      },
    );
  }
}
