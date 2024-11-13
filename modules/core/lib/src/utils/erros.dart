import 'package:dependencies/dependencies.dart';

final class ApiPingError implements AppError {
  @override
  String message;
  ApiPingError({required this.message});
  @override
  String toString() {
    return "ApiPingError - $message";
  }
}

final class ApiRandomError implements AppError {
  @override
  String message;
  ApiRandomError({required this.message});
  @override
  String toString() {
    return "ApiRandomError - $message";
  }
}

final class ApiValidateError implements AppError {
  final ErrorResponseModel? errorResponse;
  @override
  String message;
  ApiValidateError({
    required this.message,
    this.errorResponse,
  });
  @override
  String toString() {
    return "ApiValidateError - $message";
  }
}
