import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/religious_books_repo/religious_books_repo.dart';

import '../../../data/models/religious_books.dart';

part 'religious_books_state.dart';

class ReligiousBooksCubit extends Cubit<ReligiousBooksState> {
  ReligiousBooksCubit(this.religiousBooksRepo) : super(ReligiousBooksInitial());

  final ReligiousBooksRepo religiousBooksRepo;

  Future<void> fetchReligiousBooksList() async {
    emit(ReligiousBooksLoading());
    var result = await religiousBooksRepo.fetchReligiousBooks();
    result.fold(
          (failure) {
        emit(ReligiousBooksFailure(failure.errMessage));
      },
          (booksList) {
        if (booksList.isEmpty) {
          emit(ReligiousBooksFailure("No data available"));
        } else {
          emit(ReligiousBooksSuccess(
              booksList));
        }
      },
    );
  }

}
