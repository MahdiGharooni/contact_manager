class ResponseBase {
  ResponseBase({
    required this.data,
    required this.statusCode,
  });

  final dynamic data;
  final int statusCode;
}
