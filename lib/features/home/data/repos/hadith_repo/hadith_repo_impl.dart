import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/errors/failure.dart';
import '../../models/hadith_book.dart';
import "hadith_repo.dart";

class HadithRepoImpl implements HadithRepo {
  ApiService apiService;
  HadithRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Book>>> fetchHadithBooks() async {
    try {
      var data = await apiService.get(
        baseUrl: 'https://api.hadith.gading.dev/',
        endPoint: 'books/',
      );

      if (data["data"] is List) {
        List<Book> bookList = [];
        for (var item in data["data"]) {
          bookList.add(Book.fromJson(item));
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
  Future<Either<Failure, List<Hadith>>> fetchHadith(String bookId) async {
    try {
      // https://api.hadith.gading.dev/books/bukhari?range=300-500.
      var data = await apiService.get(
        baseUrl: 'https://api.hadith.gading.dev/',
        endPoint: 'books/$bookId?range=300-500.',
      );

      if (data["data"]["hadiths"] is List) {
        List<Hadith> hadithList = [];
        for (var item in data["data"]["hadiths"]) {
          hadithList.add(Hadith.fromJson(item));
        }
        return Right(hadithList);
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
