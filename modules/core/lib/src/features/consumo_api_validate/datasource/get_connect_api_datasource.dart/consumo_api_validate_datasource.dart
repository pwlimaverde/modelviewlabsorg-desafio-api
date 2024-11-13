import 'package:dependencies/dependencies.dart';

import '../../../../utils/parameters.dart';
import '../../domain/usecase/model/data_api_response_validate.dart';
import 'api_validate_provider.dart';

///Datasources
final class ConsumoApiValidateDatasource
    implements Datasource<DataApiResponseValidate> {
  final ApiValidateProvider apiProvider;
  ConsumoApiValidateDatasource({
    required this.apiProvider,
  });
  @override
  Future<DataApiResponseValidate> call(
    ParametrosValidate parameters,
  ) async {
    try {
      final response = await apiProvider.postValidator(parameters.password);
      switch (response.statusCode) {
        case 202 || 400 || 422:
          return DataApiResponseValidate(responseMap: response.body);
        default:
          throw parameters.error
            ..message =
                "Resposta inválidada do servidor - ${response.statusCode}";
      }
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
