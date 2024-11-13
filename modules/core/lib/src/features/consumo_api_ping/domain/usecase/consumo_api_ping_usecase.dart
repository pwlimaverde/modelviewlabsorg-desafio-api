import 'package:dependencies/dependencies.dart';

import '../../../../models/pong_response_model.dart';
import '../../../../utils/erros.dart';
import 'model/data_api_response_ping.dart';

///Usecase with external Datasource call
final class ConsumoApiPingUsecase
    extends UsecaseBaseCallData<PongResponseModel, DataApiResponsePing> {
  ConsumoApiPingUsecase(super.datasource);

  @override
  Future<ReturnSuccessOrError<PongResponseModel>> call(
      NoParams parameters) async {
    final resultDatacource = await resultDatasource(
      parameters: parameters,
      datasource: datasource,
    );

    switch (resultDatacource) {
      case SuccessReturn<DataApiResponsePing>():
        final data =
            PongResponseModel.fromString(resultDatacource.result.response);
        if (data.isPong) {
          return SuccessReturn(
            success: data,
          );
        } else {
          return ErrorReturn(
            error: ApiPingError(
                message:
                    "Falha na verificação, retorno da API invalido - Resultado - ${resultDatacource.result.response}."),
          );
        }
      case ErrorReturn<DataApiResponsePing>():
        return ErrorReturn(
            error: ApiPingError(message: "Falha ao carregar dados da API."));
    }
  }
}
