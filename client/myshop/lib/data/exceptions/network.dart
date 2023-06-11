class AppNetworkException implements Exception {
  final String message;
  final int statusCode;
 AppNetworkException({required this.message, required this.statusCode});

  @override
  String toString() {
    return "$message has occured with $statusCode";
  }
}
