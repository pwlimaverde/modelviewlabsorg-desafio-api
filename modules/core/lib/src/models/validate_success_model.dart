// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ValidateSuccessModel {
  final String id;
  final String message;
  ValidateSuccessModel({
    required this.id,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
    };
  }

  factory ValidateSuccessModel.fromMap(Map<String, dynamic> map) {
    return ValidateSuccessModel(
      id: (map['id'] ?? '') as String,
      message: (map['message'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ValidateSuccessModel.fromJson(String source) => ValidateSuccessModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ValidateSuccessModel(id: $id, message: $message)';

  @override
  bool operator ==(covariant ValidateSuccessModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.message == message;
  }

  @override
  int get hashCode => id.hashCode ^ message.hashCode;
}
