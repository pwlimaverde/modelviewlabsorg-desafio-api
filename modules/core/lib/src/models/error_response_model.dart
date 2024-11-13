import 'dart:convert';


class ErrorResponseModel {
  final String message;
  final String errors;
  ErrorResponseModel({
    required this.message,
    required this.errors,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'errors': errors,
    };
  }

  factory ErrorResponseModel.fromMap(Map<String, dynamic> map) {
    return ErrorResponseModel(
      message: (map['message'] ?? '') as String,
      errors: (map['errors'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorResponseModel.fromJson(String source) => ErrorResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorResponseModel(message: $message, errors: $errors)';

  @override
  bool operator ==(covariant ErrorResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.errors == errors;
  }

  @override
  int get hashCode => message.hashCode ^ errors.hashCode;
}
