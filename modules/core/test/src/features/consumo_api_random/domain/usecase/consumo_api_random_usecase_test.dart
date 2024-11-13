import 'package:core/src/features/consumo_api_random/domain/usecase/consumo_api_random_usecase.dart';
import 'package:core/src/features/consumo_api_random/domain/usecase/model/data_api_response_random.dart';

import 'package:core/src/utils/erros.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class ConsumoApiRandomDatasourceMock extends Mock
    implements Datasource<DataApiResponseRandom> {}

void main() {
  late NoParams parameters;
  late Datasource<DataApiResponseRandom> datasource;
  late UsecaseBaseCallData<PasswordSchemaModel, DataApiResponseRandom>
      consumoApiRandomUsecase;

  setUp(() {
    parameters = NoParams(error: ApiPingError(message: "teste data"));
    datasource = ConsumoApiRandomDatasourceMock();
    consumoApiRandomUsecase = ConsumoApiRandomUsecase(datasource);
  });

  test('Deve retornar um success com PasswordSchemaModel', () async {
    when(() => datasource(parameters)).thenAnswer(
      (_) => Future.value(
        DataApiResponseRandom(
          responseMap: {"password": "5d8a3B1f-1ce9-4fe8-a4c5-7a2bc9c62dbb"},
        ),
      ),
    );
    final data = await consumoApiRandomUsecase(parameters);
    switch (data) {
      case SuccessReturn<PasswordSchemaModel>():
        expect(data.result, isA<PasswordSchemaModel>());
      case ErrorReturn<PasswordSchemaModel>():
        expect(data.result, isA<ApiPingError>());
    }
  });

  test('Deve retornar um ErrorReturn, Falha ao carregar dados da API',
      () async {
    when(() => datasource(parameters)).thenThrow(Exception());
    final data = await consumoApiRandomUsecase(parameters);
    switch (data) {
      case SuccessReturn<PasswordSchemaModel>():
        expect(data.result, isA<PasswordSchemaModel>());
      case ErrorReturn<PasswordSchemaModel>():
        expect(
            data.result.message,
            equals(
                'Falha ao carregar dados da API. - teste data - Cod. 02-1 --- Catch: Exception'));
    }
  });
}
