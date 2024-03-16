class ErrorResponse {
  static const String _fieldError = 'error';
  static const String _fieldMessage = 'message';
  static const String _fieldTimestamp = 'timestamp';
  static const String _fieldPath = 'path';

  final String timestamp;
  final String error;
  final String message;
  final String path;

  const ErrorResponse(
      {required this.timestamp,
      required this.error,
      required this.message,
      required this.path});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      timestamp: json[_fieldTimestamp].toString(),
      error: json[_fieldError].toString(),
      message: json[_fieldMessage] ?? '',
      path: json[_fieldPath],
    );
  }
}
