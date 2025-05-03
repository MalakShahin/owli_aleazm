import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/errors/failure.dart';

import '../../models/surah_number.dart';

import '../../../../../core/utils/api_service.dart';
import 'surah_repo.dart';

class SurahRepoImpl implements SurahRepo {
  ApiService apiService;
  SurahRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Surah>>> fetchSurahList() async {
    try {
      var data = await apiService.get(
          baseUrl: 'https://api.alquran.cloud/v1/',
          endPoint: 'quran/quran-uthmani',
      );

      if (data["data"]["surahs"] is List) {
        List<Surah> surahsList = [];
        for (var item in data["data"]["surahs"]) {
          surahsList.add(Surah.fromJson(item));
        }
        return Right(surahsList);
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
