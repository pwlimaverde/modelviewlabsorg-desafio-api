// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dependencies/dependencies.dart';



class ErrorResponseModel {
  final String message;
  final List<String>? errors;
  ErrorResponseModel({
    required this.message,
    this.errors,
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
      errors: map['errors'] != null ? List<String>.from((map['errors'] as List<String>)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorResponseModel.fromJson(String source) => ErrorResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorResponseModel(message: $message, errors: $errors)';

  @override
  bool operator ==(covariant ErrorResponseModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.message == message &&
      listEquals(other.errors, errors);
  }

  @override
  int get hashCode => message.hashCode ^ errors.hashCode;
}
