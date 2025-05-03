

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/religious_books.dart';
import '../../../data/repos/religious_books_repo/religious_books_repo.dart';

part 'religious_book_details_state.dart';

class ReligiousBookDetailsCubit extends Cubit<ReligiousBookDetailsState> {
  ReligiousBookDetailsCubit(this.religiousBooksRepo) : super(ReligiousBookDetailsInitial());

  final ReligiousBooksRepo religiousBooksRepo;

  Future<void> fetchReligiousBooksList({required int id}) async {
    emit(ReligiousBookDetailsLoading());
    var result = await religiousBooksRepo.fetchReligiousBookDetails(id: id);
    result.fold(
          (failure) {
        emit(ReligiousBookDetailsFailure(failure.errMessage));
      },
          (books) {
        emit(ReligiousBookDetailsSuccess(
            books));
            },
    );
  }


}
