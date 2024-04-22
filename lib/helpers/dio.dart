import 'package:pokemon/exports.dart';
import 'package:pokemon/helpers/endpoint_model.dart';
// import '/exports.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/helpers/methods_constant.dart';
import 'package:pokemon/helpers/response_model.dart';

class ApiRequests {
  Future<ApiModelsResponse> send({
    required ApiEndpointModel endpoint,
    required ApiMethods method,
    String query = "",
    Map<String, dynamic> data = const {},
    String appLanguage = 'en',
    FormData? file,
    Function(int, int)? onSendProgress,
  }) async {
    log('* API FETCH DATA: send | Start | Method: $method | Endpoint: ${endpoint.get}');

    try {
      String dataJson = json.encode({...data, "info": ""});

      var dio = Dio();

      dio
        ..options.headers = {
          'Content-Type': 'application/json; charset=UTF-8',
        }
        ..options.receiveTimeout = (const Duration(seconds: 10));

      // Request:
      late Response<dynamic> resp;
      late String url;
      switch (method) {
        case ApiMethods.delete:
          resp = await dio.delete(endpoint.delete!, data: dataJson);
          break;
        case ApiMethods.get:
          resp = await dio.get(endpoint.get!, data: dataJson);
          break;
        case ApiMethods.patch:
          resp = await dio.patch(endpoint.patch!, data: dataJson);
          break;
        case ApiMethods.list:
          resp = await dio.get(endpoint.list!, data: dataJson);
          break;
        case ApiMethods.post:
          if (file != null) {
            resp = await dio.post(endpoint.post!, data: file, onSendProgress: onSendProgress);
          } else {
            resp = await dio.post(endpoint.post!, data: dataJson);
          }
          break;
        case ApiMethods.put:
          url = endpoint.put!;
          resp = await dio.put(url, data: dataJson);
          break;
      }

      try {
        return ApiModelsResponse.fromJson({
          'server_status': true,
          'response_status': true,
          'message': "Success",
          'data': resp.data,
        });
      } catch (e) {
        return ApiModelsResponse.withError(statusCode: 400, message: 'Bad Data');
      }
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      log('* API FETCH DATA: requests | END | Catch');
      inspect(e);
      return ApiModelsResponse.withError(statusCode: 404, message: 'Check your internet and try again');
    }
  }

  ApiModelsResponse _handleError(DioException e) {
    log('* API FETCH DATA: requests | END | DioException | ${e.response?.statusCode} | ${e.response?.statusMessage}');

    switch (e.response?.statusCode) {
      case 400:
        return ApiModelsResponse.withError(statusCode: 400, message: e.response?.data['message'] ?? "Bad Request");
      case 401:
        return ApiModelsResponse.withError(statusCode: 401, message: 'You don\'t have permission to access this page. \n \n Please login or contact support.');
      case 403:
        return ApiModelsResponse.withError(statusCode: 403, message: 'You don\'t have permission to access this page. \n \n Please contact support.');
      case 404:
        return ApiModelsResponse.withError(statusCode: 404, message: 'Page Not Found');
      case 426:
        return ApiModelsResponse.withError(
            statusCode: 426,
            message: e.response?.data['message'] ?? 'Great news, a new version of this app is now available. Please update your app to the latest version.');
      case 500:
        return ApiModelsResponse.withError(statusCode: 500, message: 'Internal Server Error');
      case 503:
        return ApiModelsResponse.withError(statusCode: 503, message: e.response?.data['message'] ?? 'Service under Maintenance. Please try again later.');
    }

    log('* API FETCH DATA: requests | END | DioException | Internet Error | ${e.response?.statusMessage}');
    return ApiModelsResponse.withError(statusCode: e.response?.statusCode ?? 404, message: 'Check your internet and try again');
  }
}
