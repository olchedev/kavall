// ignore_for_file: prefer-match-file-name

class AppException implements Exception {
  final dynamic message;

  const AppException(this.message);

  @override
  String toString() => 'AppException: $message';
}

class NetworkException extends AppException {
  final int statusCode;

  const NetworkException(dynamic message, this.statusCode) : super(message);

  @override
  String toString() => 'NetworkException ($statusCode): $message';
}

class NullResultException extends AppException {
  const NullResultException([dynamic message = 'Result is null'])
      : super(message);
}

class ResultStatusException extends AppException {
  const ResultStatusException([dynamic message = 'Result status exception'])
      : super(message);
}
