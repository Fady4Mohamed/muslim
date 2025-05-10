import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;

  final baseUrl = "https://api.aladhan.com/v1/";

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    var response = await _dio.get('$baseUrl$endPoint',
        queryParameters: queryParameters, options: Options(headers: headers));
    return response.data;
  }

  Future<Response<dynamic>> post(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    var response = await _dio.post('$baseUrl$endPoint',
        data: data,
        options: Options(headers: headers),
        queryParameters: queryParameters);
    return response;
  }

  Future<Map<String, dynamic>> patch(
      {required String endPoint,
      required Object data,
      Map<String, dynamic>? headers}) async {
    var response = await _dio.patch(
      '$baseUrl$endPoint',
      data: data,
      options: Options(headers: headers),
      onSendProgress: (count, total) {},
    );
    return response.data;
  }

  Future<Response> delete(
      {required String endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    var response = await _dio.delete('$baseUrl$endPoint',
        data: body,
        options: Options(headers: headers),
        queryParameters: queryParameters);
    return response;
  }
}
