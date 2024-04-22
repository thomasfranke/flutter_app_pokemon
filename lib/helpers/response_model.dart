class ApiModelsResponse {
  final bool serverStatus;
  final bool responseStatus;
  final int statusCode;
  final String message;
  final dynamic data;

  ApiModelsResponse({
    required this.serverStatus,
    required this.responseStatus,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ApiModelsResponse.fromJson(Map<String, dynamic> json) => ApiModelsResponse(
        serverStatus: json['server_status'],
        responseStatus: json['response_status'],
        statusCode: json['status_code'] ?? 200,
        message: json['message'],
        data: json['data'],
      );

  factory ApiModelsResponse.withError({required int statusCode, required String message}) => ApiModelsResponse(
        serverStatus: statusCode == 401 ? true : false,
        responseStatus: false,
        statusCode: statusCode,
        message: message,
        data: {},
      );
}
