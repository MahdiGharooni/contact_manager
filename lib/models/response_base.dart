class ResponseBase {
  ResponseBase({
    required this.data,
    required this.statusCode,
    this.message,
  });

  final dynamic data;
  final int statusCode;
  final String? message;
}
