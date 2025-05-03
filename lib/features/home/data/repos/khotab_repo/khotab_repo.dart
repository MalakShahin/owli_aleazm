
import 'package:dartz/dartz.dart';

import '../../../../../core/utils/errors/failure.dart';
import '../../models/khotab_model.dart';

abstract class KhotabRepo {
  Future<Either<Failure,List<Khotab>>> fetchKhotabList();

}