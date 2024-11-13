import 'package:dependencies/dependencies.dart';

import '../../domain/usecase/model/data_api_response_random.dart';
import 'api_ramdom_provider.dart';

///Datasources
final class ConsumoApiRandomDatasource
    implements Datasource<DataApiResponseRandom> {
  final ApiRandomProvider apiProvider;
  ConsumoApiRandomDatasource({
    required this.apiProvider,
  });
  @override
  Future<DataApiResponseRandom> call(
    NoParams parameters,
  ) async {
    try {
      final response = await apiProvider.getPong();

      switch (response.statusCode) {
        case 200:
          return DataApiResponseRandom(responseMap: response.body);
        case 405:
          throw parameters.error..message = "Método não permitido!";
        default:
          throw parameters.error..message = "Resposta inválidada do servidor - ${response.statusCode}";
      }
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
