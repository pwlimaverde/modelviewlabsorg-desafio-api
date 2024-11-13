import 'package:dependencies/dependencies.dart';

import '../../../../utils/erros.dart';
import 'model/data_api_response_random.dart';

///Usecase with external Datasource call
final class ConsumoApiRandomUsecase
    extends UsecaseBaseCallData<PasswordSchemaModel, DataApiResponseRandom> {
  ConsumoApiRandomUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<PasswordSchemaModel>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<DataApiResponseRandom>():
        final data = resultDatacource.result.responseMap;
          return SuccessReturn(
            success: PasswordSchemaModel.fromMap(data),
          );

      case ErrorReturn<DataApiResponseRandom>():
        return ErrorReturn(
            error: ApiPingError(message: "Falha ao carregar dados da API. - ${resultDatacource.result.message}"));
    }
  }
}
