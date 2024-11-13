import 'package:core/src/features/consumo_api_ping/datasource/get_connect_api_datasource.dart/api_ping_provider.dart';
import 'package:core/src/features/consumo_api_ping/datasource/get_connect_api_datasource.dart/consumo_api_ping_datasource.dart';
import 'package:core/src/features/consumo_api_ping/domain/usecase/model/data_api_response_ping.dart';
import 'package:core/src/utils/erros.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class ApiProviderMock extends Mock implements ApiPingProvider {}

void main() {
  late NoParams parameters;
  late ApiPingProvider apiProvider;
  late Datasource<DataApiResponsePing> datasource;

  setUp(() {
    parameters = NoParams(error: ApiPingError(message: "teste data"));
    apiProvider = ApiProviderMock();
    datasource = ConsumoApiPingDatasource(apiProvider: apiProvider);
  });

  test('Deve retornar um DataApiResponsePing com "pong"', () async {
    when(() => apiProvider.getPong()).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        bodyString: 'pong',
        statusCode: 200,
      )),
    );
    final data = await datasource(parameters);
    expect(data, isA<DataApiResponsePing>());
    expect(data.response, equals('pong'));
  });

  test('Deve retornar um DataApiResponsePing com ""', () async {
    when(() => apiProvider.getPong()).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        bodyString: '',
        statusCode: 200,
      )),
    );
    final data = await datasource(parameters);
    expect(data, isA<DataApiResponsePing>());
    expect(data.response, equals(''));
  });

  test('Deve retornar uma Exception', () async {
    when(() => apiProvider.getPong()).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        body: '',
      )),
    );

    expect(() async => await datasource(parameters), throwsA(isA<Exception>()));
  });

  test('Deve retornar uma Exception', () async {
    when(() => apiProvider.getPong()).thenThrow(Exception());

    expect(() async => await datasource(parameters), throwsA(isA<Exception>()));
  });
}
