import 'package:core/src/features/consumo_api_validate/domain/usecase/consumo_api_validate_usecase.dart';
import 'package:core/src/features/consumo_api_validate/domain/usecase/model/data_api_response_validate.dart';

import 'package:core/src/utils/erros.dart';
import 'package:core/src/utils/parameters.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class ConsumoApiValidateDatasourceMock extends Mock
    implements Datasource<DataApiResponseValidate> {}

void main() {
  late ParametrosValidate parameters;
  late Datasource<DataApiResponseValidate> datasource;
  late UsecaseBaseCallData<ValidateSuccessModel, DataApiResponseValidate>
      consumoApiValidateUsecase;

  setUp(() {
    parameters = ParametrosValidate(
      error: ApiValidateError(
        message: "teste data",
        errorResponse: ErrorResponseModel(
          message: "Password format is invalid",
          errors: ["Password must contain at least 8 characters"],
        ),
      ),
    );
    datasource = ConsumoApiValidateDatasourceMock();
    consumoApiValidateUsecase = ConsumoApiValidateUsecase(datasource);
  });

  test('Deve retornar um success com ValidateSuccessModel', () async {
    when(() => datasource(parameters)).thenAnswer(
      (_) => Future.value(
        DataApiResponseValidate(
          responseMap: {
            "id": "123e4567-e89b-12d3-a456-426614174000",
            "message": "Password is valid",
          },
        ),
      ),
    );
    final data = await consumoApiValidateUsecase(parameters);
    switch (data) {
      case SuccessReturn<ValidateSuccessModel>():
        expect(data.result, isA<ValidateSuccessModel>());
      case ErrorReturn<ValidateSuccessModel>():
        fail('Não Deveria ter lançado uma exceção!');
    }
  });

  test(
      'Deve retornar um ErrorReturn, com ErrorResponseModel - Password format is invalid',
      () async {
    when(() => datasource(parameters)).thenAnswer(
      (_) => Future.value(
        DataApiResponseValidate(
          responseMap: {
            "message": "Password format is invalid",
            "errors": ["Password must contain at least 8 characters"]
          },
        ),
      ),
    );
    final data = await consumoApiValidateUsecase(parameters);
    switch (data) {
      case SuccessReturn<ValidateSuccessModel>():
        fail('Deveria ter lançado uma exceção!');
      case ErrorReturn<ValidateSuccessModel>():
        final error = data.result;
        if (error is ApiValidateError) {
          expect(
              error.errorResponse,
              equals(ErrorResponseModel(
                message: "Password format is invalid",
                errors: ["Password must contain at least 8 characters"],
              )));
        } else {
          fail('Deveria ser ApiValidateError!');
        }
    }
  });

  test(
      'Deve retornar um ErrorReturn, com ErrorResponseModel - Invalid request payload',
      () async {
    when(() => datasource(parameters)).thenAnswer(
      (_) => Future.value(
        DataApiResponseValidate(
          responseMap: {
            "message": "Invalid request payload",
          },
        ),
      ),
    );
    final data = await consumoApiValidateUsecase(parameters);
    switch (data) {
      case SuccessReturn<ValidateSuccessModel>():
        fail('Deveria ter lançado uma exceção!');
      case ErrorReturn<ValidateSuccessModel>():
        final error = data.result;
        if (error is ApiValidateError) {
          expect(
              error.errorResponse,
              equals(ErrorResponseModel(
                message: "Invalid request payload",
              )));
        } else {
          fail('Deveria ser ApiValidateError!');
        }
    }
  });

  test(
      'Deve retornar um ErrorReturn, com ErrorResponseModel - Falha ao carregar dados da API.',
      () async {
    when(() => datasource(parameters)).thenThrow(Exception());

    final data = await consumoApiValidateUsecase(parameters);
    switch (data) {
      case SuccessReturn<ValidateSuccessModel>():
        fail('Deveria ter lançado uma exceção!');
      case ErrorReturn<ValidateSuccessModel>():
        final error = data.result;
        if (error is ApiValidateError) {
          expect(
              error.errorResponse,
              equals(ErrorResponseModel(
                  message:
                      "Falha ao carregar dados da API. t - teste data - Cod. 02-1 --- Catch: Exception",
                  errors: null)));
        } else {
          fail('Deveria ser ApiValidateError!');
        }
    }
  });
}
