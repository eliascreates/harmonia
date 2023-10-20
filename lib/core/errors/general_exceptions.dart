abstract class AppException implements Exception {
  final String message;

  AppException({this.message = 'Unexpected Error occurred'});

  @override
  String toString() => 'AppException: $message';
}

class ServerException extends AppException {
  ServerException({super.message = 'Server error occurred.'});
}

class NetworkException extends AppException {
  NetworkException({super.message = 'Network error occurred.'});
}

class CacheException extends AppException {
  CacheException({super.message = 'Cache error occurred.'});
}

class LocalStorageException extends AppException {
  LocalStorageException({super.message = 'Local storage error occurred.'});
}
