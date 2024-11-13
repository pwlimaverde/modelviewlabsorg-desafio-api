// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dependencies/dependencies.dart';

final class DataApiResponseValidate {
  final Map<String, dynamic> responseMap;
  DataApiResponseValidate({
    required this.responseMap,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'responseMap': responseMap,
    };
  }

  factory DataApiResponseValidate.fromMap(Map<String, dynamic> map) {
    return DataApiResponseValidate(
      responseMap: Map<String, dynamic>.from((map['responseMap'] ?? const <Map<String, dynamic>>{}) as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataApiResponseValidate.fromJson(String source) => DataApiResponseValidate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DataApiResponseValidate(responseMap: $responseMap)';

  @override
  bool operator ==(covariant DataApiResponseValidate other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;
  
    return 
      mapEquals(other.responseMap, responseMap);
  }

  @override
  int get hashCode => responseMap.hashCode;
}
