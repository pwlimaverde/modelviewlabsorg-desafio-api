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