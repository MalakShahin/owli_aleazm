import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/errors/failure.dart';
import '../../models/khotab_model.dart';
import 'khotab_repo.dart';

class KhotabRepoImpl implements KhotabRepo {
  ApiService apiService;
  KhotabRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Khotab>>> fetchKhotabList() async {
    try {
      // https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/khotab/ar/ar/1/25/json
      var data = await apiService.get(
        baseUrl: 'https://api3.islamhouse.com/v3/',
        endPoint: 'paV29H2gm56kvLPy/main/khotab/ar/ar/1/25/json',
      );

      if (data["data"] is List) {
        List<Khotab> khotabList = [];
        for (var item in data["data"]) {
          khotabList.add(Khotab.fromJson(item));
        }
        return Right(khotabList);
      } else {
        return Left(
            ServerFailure('Invalid response format. Expected a list of data.'));
      }
    } catch (e) {
      // Handle DioException (or any other exception)
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
