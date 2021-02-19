class ServerException implements Exception {
  final String message = 'ERROR: An Exception was thrown by the server';
}

class CacheException implements Exception {
  final String message =
      'ERROR: An Exception was thrown when accessing the cache';
}
