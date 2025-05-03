



import 'package:dio/dio.dart';

class ApiService {
  // https://api.alquran.cloud/v1/quran/quran-uthmani
  // https://api.alquran.cloud/v1/surah
  // final baseUrl = 'https://api.alquran.cloud/v1/';

  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String baseUrl,required String endPoint}) async {
    var response = await _dio.get("$baseUrl$endPoint");
    // print(response.data);
    return response.data;
  }
  // Future<Map<String, dynamic>> get({required String baseUrl, required String endPoint}) async {
  //   var response = await _dio.get("$baseUrl$endPoint");
  //
  //   // Check content type
  //   if (response.headers.value('content-type')?.contains('application/json') ?? false) {
  //     print("Response is JSON.");
  //   } else {
  //     print("Unexpected content type: ${response.headers.value('content-type')}");
  //   }
  //
  //   return response.data;
  // }
}
