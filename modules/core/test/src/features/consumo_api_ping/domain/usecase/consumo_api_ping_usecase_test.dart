import 'package:core/src/features/consumo_api_ping/domain/usecase/consumo_api_ping_usecase.dart';
import 'package:core/src/features/consumo_api_ping/domain/usecase/model/data_api_response_ping.dart';
import 'package:core/src/models/pong_response_model.dart';
import 'package:core/src/utils/erros.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class ConsumoApiPingDatasourceMock extends Mock
    implements Datasource<DataApiResponsePing> {}

void main() {
  late NoParams parameters;
  late Datasource<DataApiResponsePing> datasource;
  late UsecaseBaseCallData<PongResponseModel, DataApiResponsePing> consumoApiPingUsecase;


  setUp(() {
    parameters = NoParams(error: ApiPingError(message: "teste data"));
    datasource = ConsumoApiPingDatasourceMock();
    consumoApiPingUsecase = ConsumoApiPingUsecase(datasource);

  });

  test('Deve retornar um success com "isPong: true"', () async {

    when(() => datasource(parameters)).thenAnswer(
      (_) => Future.value(DataApiResponsePing(response: 'pong')),
    );
    final data = await consumoApiPingUsecase(parameters);
    switch (data) {
      case SuccessReturn<PongResponseModel>():
        expect(data.result, isA<PongResponseModel>());
      case ErrorReturn<PongResponseModel>():
        expect(data.result, isA<ApiPingError>());
    }
  });

  test('Deve retornar um ErrorReturn, retorno da API invalido com "isPong: false"', () async {

    when(() => datasource(parameters)).thenAnswer(
      (_) => Future.value(DataApiResponsePing(response: 'teste erro retorno')),
    );
    final data = await consumoApiPingUsecase(parameters);
    switch (data) {
      case SuccessReturn<PongResponseModel>():
        expect(data.result, isA<PongResponseModel>());
      case ErrorReturn<PongResponseModel>():
        expect(data.result, isA<ApiPingError>());
        expect(data.result.message, equals('Falha na verificação, retorno da API invalido - Resultado - teste erro retorno.'));
    }
  });

  test('Deve retornar um ErrorReturn, Falha ao carregar dados da API', () async {

    when(() => datasource(parameters)).thenThrow(Exception());
    final data = await consumoApiPingUsecase(parameters);
    switch (data) {
      case SuccessReturn<PongResponseModel>():
        expect(data.result, isA<PongResponseModel>());
      case ErrorReturn<PongResponseModel>():
        expect(data.result, isA<ApiPingError>());
        expect(data.result.message, equals('Falha ao carregar dados da API.'));
    }
  });
}
