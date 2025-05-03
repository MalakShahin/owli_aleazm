



import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/errors/failure.dart';
import '../../models/religion_lessons.dart';
import 'religion_lessons_repo.dart';

class ReligionLessonsRepoImpl implements ReligionLessonsRepo {
  ApiService apiService;
  ReligionLessonsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<VideoItem>>> fetchLessonsList() async {
    try {
      // https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/videos/ar/ar/1/25/json
      var data = await apiService.get(
        baseUrl: 'https://api3.islamhouse.com/v3/',
        endPoint: 'paV29H2gm56kvLPy/main/videos/ar/ar/1/25/json',
      );

      if (data["data"] is List) {
        List<VideoItem> lessonsList = [];
        for (var item in data["data"]) {
          lessonsList.add(VideoItem.fromJson(item));
        }
        return Right(lessonsList);
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