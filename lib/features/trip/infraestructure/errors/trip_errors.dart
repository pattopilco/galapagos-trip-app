class WrongCredentials implements Exception {}

class ConnectionTimeout implements Exception {}

class CustomError implements Exception {
  final String message;
  CustomError(this.message);
}
