// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

final class DataApiResponsePing {
  final String response;
  DataApiResponsePing({
    required this.response,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'response': response,
    };
  }

  factory DataApiResponsePing.fromMap(Map<String, dynamic> map) {
    return DataApiResponsePing(
      response: (map['response'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataApiResponsePing.fromJson(String source) => DataApiResponsePing.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DataApiResponsePing(response: $response)';

  @override
  bool operator ==(covariant DataApiResponsePing other) {
    if (identical(this, other)) return true;
  
    return 
      other.response == response;
  }

  @override
  int get hashCode => response.hashCode;
}
