// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';

class ApiProvider extends GetConnect {
  final String apiEndpoint;
  final String apiPing;
  ApiProvider({
    required this.apiEndpoint,
    required this.apiPing,
  });


  Future<Response> getPong() => get('$apiEndpoint$apiPing');


}
