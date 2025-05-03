

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/errors/failure.dart';

import '../../models/religious_books.dart';

import 'religious_books_repo.dart';

class ReligiousBooksRepoImpl implements ReligiousBooksRepo{
  ApiService apiService;
  ReligiousBooksRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ReligiousBooks>>> fetchReligiousBooks() async {

    try {
      var data = await apiService.get(
        baseUrl: 'https://api3.islamhouse.com/v3/',
        endPoint: 'paV29H2gm56kvLPy/main/get-category-items/5366/books/ar/ar/1/20/json',
      );

      if (data["data"] is List) {
        List<ReligiousBooks> bookList = [];
        for (var item in data["data"]) {
          bookList.add(ReligiousBooks.fromJson(item));
        }
        return Right(bookList);
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

  @override
  Future<Either<Failure,ReligiousBooks>> fetchReligiousBookDetails({required int id}) async{
    try {
      var data = await apiService.get(
        baseUrl: 'https://api3.islamhouse.com/v3/',
        endPoint: 'paV29H2gm56kvLPy/main/get-item/$id/ar/json',
      );

      if (data['id'] != null) {
        // Parse data to ReligiousBooks model
        ReligiousBooks book = ReligiousBooks.fromJson(data);
        return Right(book);
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