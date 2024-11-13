// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:dependencies/dependencies.dart';


class DataApiResponseRandom {
  final Map<String, dynamic> responseMap;
  DataApiResponseRandom({
    required this.responseMap,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'responseMap': responseMap,
    };
  }

  factory DataApiResponseRandom.fromMap(Map<String, dynamic> map) {
    return DataApiResponseRandom(
      responseMap: Map<String, dynamic>.from((map['responseMap'] ?? const <Map<String, dynamic>>{}) as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataApiResponseRandom.fromJson(String source) => DataApiResponseRandom.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DataApiResponseRandom(responseMap: $responseMap)';

  @override
  bool operator ==(covariant DataApiResponseRandom other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;
  
    return 
      mapEquals(other.responseMap, responseMap);
  }

  @override
  int get hashCode => responseMap.hashCode;
}
