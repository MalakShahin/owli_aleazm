


import 'package:dartz/dartz.dart';

import '../../../../../core/utils/errors/failure.dart';
import '../../models/hadith_book.dart';

abstract class HadithRepo {
  Future<Either<Failure,List<Book>>> fetchHadithBooks();
  Future<Either<Failure,List<Hadith>>> fetchHadith(String bookId);
}
