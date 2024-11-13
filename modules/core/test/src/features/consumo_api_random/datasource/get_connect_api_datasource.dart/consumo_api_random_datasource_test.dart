import 'package:core/src/features/consumo_api_random/datasource/get_connect_api_datasource.dart/api_ramdom_provider.dart';
import 'package:core/src/features/consumo_api_random/datasource/get_connect_api_datasource.dart/consumo_api_random_datasource.dart';
import 'package:core/src/features/consumo_api_random/domain/usecase/model/data_api_response_random.dart';
import 'package:core/src/utils/erros.dart';
import 'package:core/src/utils/parameters.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class ApiProviderMock extends Mock implements ApiRandomProvider {}

void main() {
  late ParametrosRandom parameters;
  late ApiRandomProvider apiProvider;
  late Datasource<DataApiResponseRandom> datasource;

  setUp(() {
    parameters = ParametrosRandom(error: ApiRandomError(message: "teste data"));
    apiProvider = ApiProviderMock();
    datasource = ConsumoApiRandomDatasource(apiProvider: apiProvider);
  });

  test(
      'Deve retornar um DataApiResponsePing com PasswordSchemaModel(password: 1d16313A-f794-4470-adc1-4c7637d0b9ca)',
      () async {
    when(() => apiProvider.getPong()).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        body: {"password": "1d16313A-f794-4470-adc1-4c7637d0b9ca"},
        statusCode: 200,
      )),
    );
    final data = await datasource(parameters);
    expect(data, isA<DataApiResponseRandom>());
    expect(data.responseMap,
        equals({"password": "1d16313A-f794-4470-adc1-4c7637d0b9ca"}));
  });

  test('Deve retornar uma Exception - "ApiPingError - Método não permitido!")', () async {
    when(() => apiProvider.getPong()).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        body: null,
        statusCode: 405,
      )),
    );

    try {
      await datasource(parameters);
      fail('Deveria ter lançado uma exceção!');
    } on ApiRandomError catch (e) {
      expect(e.message, "ApiRandomError - Método não permitido!");
    }
  });

   test('Deve retornar uma Exception - "ApiPingError - Resposta inválidada do servidor - null")', () async {
    when(() => apiProvider.getPong()).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        body: null,
        statusCode: null,
      )),
    );

    try {
      await datasource(parameters);
      fail('Deveria ter lançado uma exceção!');
    } on ApiRandomError catch (e) {
      expect(e.message, "ApiRandomError - Resposta inválidada do servidor - null");
    }
  });

  test('Deve retornar uma Exception', () async {
    when(() => apiProvider.getPong()).thenThrow(Exception());

    expect(() async => await datasource(parameters), throwsA(isA<ApiRandomError>()));
  });
}
