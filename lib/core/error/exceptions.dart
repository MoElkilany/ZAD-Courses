class ServerException implements Exception {
  final String message;
  final int status;

  ServerException({
    required this.status,
    required this.message,
  });
}

class CacheException implements Exception {
  final String message;
  final int status;
  CacheException({
    required this.status,
    required this.message,
  });
}

class ValueException<T> implements Exception {
  final String messgae;
  final String variableName;
  final T? value;

  ValueException({
    required this.messgae,
    required this.variableName,
    required this.value,
  });
}
