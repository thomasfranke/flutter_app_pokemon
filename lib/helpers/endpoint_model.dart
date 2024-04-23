import '/exports.dart';

class ApiModelsEndpoints {
  final ApiMethods method;
  final String url;

  ApiModelsEndpoints({
    required this.method,
    required this.url,
  });
}

class ApiEndpointModel {
  final String? delete;
  final String? get;
  final String? list;
  final String? patch;
  final String? post;
  final String? put;

  ApiEndpointModel({
    this.delete,
    this.get,
    this.list,
    this.patch,
    this.post,
    this.put,
  });
}
