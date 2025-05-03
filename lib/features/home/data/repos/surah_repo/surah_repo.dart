

import 'package:dartz/dartz.dart';
import '../../models/surah_number.dart';


import '../../../../../core/utils/errors/failure.dart';

abstract class SurahRepo {
  Future<Either<Failure,List<Surah>>> fetchSurahList();
}
