// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';

class ApiValidateProvider extends GetConnect {
  final String apiEndpoint;
  final String apiValidate;
  ApiValidateProvider({
    required this.apiEndpoint,
    required this.apiValidate,
  });

  @override
  void onInit() {
    super.onInit();
    httpClient.addRequestModifier<void>((request) {
      request.headers['no-delay'] = 'false';
      return request;
    });
  }

  Future<Response> postValidator(String body) => post(
        '$apiEndpoint$apiValidate',
        {
          'password': body,
        },
      );
}
