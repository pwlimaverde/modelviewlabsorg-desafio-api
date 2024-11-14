import 'package:core/src/features/consumo_api_validate/datasource/get_connect_api_datasource.dart/api_validate_provider.dart';
import 'package:core/src/features/consumo_api_validate/datasource/get_connect_api_datasource.dart/consumo_api_validate_datasource.dart';
import 'package:core/src/features/consumo_api_validate/domain/usecase/model/data_api_response_validate.dart';
import 'package:core/src/utils/erros.dart';
import 'package:core/src/utils/parameters.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class ApiProviderMock extends Mock implements ApiValidateProvider {}

void main() {
  late ParametrosValidate parameters;
  late ApiValidateProvider apiProvider;
  late Datasource<DataApiResponseValidate> datasource;

  setUp(() {
    parameters = ParametrosValidate(
        error: ApiValidateError(message: "teste data"), password: '12345678');
    apiProvider = ApiProviderMock();
    datasource = ConsumoApiValidateDatasource(apiProvider: apiProvider);
  });

  test(
      'Deve retornar um DataApiResponseValidate com id": "123e4567-e89b-12d3-a456-426614174000"',
      () async {
    when(() => apiProvider.postValidator(parameters.password)).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        body: {
          "id": "123e4567-e89b-12d3-a456-426614174000",
          "message": "Password is valid"
        },
        statusCode: 202,
      )),
    );
    final data = await datasource(parameters);
    expect(data, isA<DataApiResponseValidate>());
    expect(
        data.responseMap,
        equals({
          "id": "123e4567-e89b-12d3-a456-426614174000",
          "message": "Password is valid",
        }));
  });

  test(
      'Deve retornar um DataApiResponseValidate com "message": "Password format is invalid"',
      () async {
    when(() => apiProvider.postValidator(parameters.password)).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        body: {
          "message": "Password format is invalid",
          "errors": ["Password must contain at least 8 characters"]
        },
        statusCode: 400,
      )),
    );
    final data = await datasource(parameters);
    expect(data, isA<DataApiResponseValidate>());
    expect(
        data.responseMap,
        equals({
          "message": "Password format is invalid",
          "errors": ["Password must contain at least 8 characters"]
        }));
  });

  test(
      'Deve retornar um DataApiResponseValidate com "message": "Invalid request payload"',
      () async {
    when(() => apiProvider.postValidator(parameters.password)).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        body: {
          "message": "Invalid request payload"
        },
        statusCode: 422,
      )),
    );
    final data = await datasource(parameters);
    expect(data, isA<DataApiResponseValidate>());
    expect(
        data.responseMap,
        equals({
          "message": "Invalid request payload"
        }));
  });

  test(
      'Deve retornar um Error com Resposta inválidada do servidor - 405")',
      () async {
    when(() => apiProvider.postValidator(parameters.password)).thenAnswer(
      (_) => Future.value(const Response<dynamic>(
        body: {},
        statusCode: 405,
      )),
    );

    try {
      await datasource(parameters);
      fail('Deveria ter lançado uma exceção!');
    } on ApiValidateError catch (e) {
      expect(e.message, "ApiValidateError - Resposta inválidada do servidor - 405");
    }
  });

  test('Deve retornar uma Exception', () async {
    when(() => apiProvider.postValidator(parameters.password)).thenThrow(Exception());

    expect(() async => await datasource(parameters),
        throwsA(isA<ApiValidateError>()));
  });
}
