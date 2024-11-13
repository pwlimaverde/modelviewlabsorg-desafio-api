// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';

class ApiRandomProvider extends GetConnect {
  final String apiEndpoint;
  final String apiRandom;
  ApiRandomProvider({
    required this.apiEndpoint,
    required this.apiRandom,
  });

  @override
  void onInit() {
    super.onInit();
    httpClient.addRequestModifier<void>((request) {
      request.headers['no-delay'] = 'false';
      return request;
    });

  }

  Future<Response> getRandom() => get('$apiEndpoint$apiRandom');


}
