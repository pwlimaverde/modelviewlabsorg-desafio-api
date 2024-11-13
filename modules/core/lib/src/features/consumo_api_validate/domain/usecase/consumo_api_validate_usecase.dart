import 'package:dependencies/dependencies.dart';

import '../../../../utils/erros.dart';
import '../../../../utils/parameters.dart';
import 'model/data_api_response_validate.dart';

///Usecase with external Datasource call
final class ConsumoApiValidateUsecase
    extends UsecaseBaseCallData<ValidateSuccessModel, DataApiResponseValidate> {
  ConsumoApiValidateUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<ValidateSuccessModel>> call(
    ParametrosValidate parameters,
  ) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<DataApiResponseValidate>():
        final data = resultDatacource.result.responseMap;

        if (data.keys.contains('id')) {
          return SuccessReturn(
            success: ValidateSuccessModel.fromMap(data),
          );
        } else {
          return ErrorReturn(
              error: ApiValidateError(
            message: "Falha ao carregar dados da API.",
            errorResponse: ErrorResponseModel.fromMap(data),
          ));
        }

      case ErrorReturn<DataApiResponseValidate>():
        return ErrorReturn(
          error: ApiValidateError(
            message: "Falha ao carregar dados da API.",
            errorResponse: ErrorResponseModel(
              message:
                  "Falha ao carregar dados da API. t - ${resultDatacource.result.message}",
            ),
          ),
        );
    }
  }
}
