import 'dart:convert';

final class PasswordSchemaModel {
  final String password;
  PasswordSchemaModel({
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
    };
  }

  factory PasswordSchemaModel.fromMap(Map<String, dynamic> map) {
    return PasswordSchemaModel(
      password: (map['password'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PasswordSchemaModel.fromJson(String source) => PasswordSchemaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PasswordSchemaModel(password: $password)';

  @override
  bool operator ==(covariant PasswordSchemaModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.password == password;
  }

  @override
  int get hashCode => password.hashCode;
}
