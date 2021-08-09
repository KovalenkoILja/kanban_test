class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() {
    return message;
  }
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);

  @override
  String toString() {
    return message;
  }
}
