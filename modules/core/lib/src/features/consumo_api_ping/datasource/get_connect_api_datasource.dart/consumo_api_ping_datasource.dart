import 'package:dependencies/dependencies.dart';

import '../../domain/usecase/model/data_api_response_ping.dart';
import 'api_ping_provider.dart';

///Datasources
final class ConsumoApiPingDatasource
    implements Datasource<DataApiResponsePing> {
  final ApiPingProvider apiProvider;
  ConsumoApiPingDatasource({
    required this.apiProvider,
  });
  @override
  Future<DataApiResponsePing> call(
    NoParams parameters,
  ) async {
    try {
      final response = await apiProvider.getPong();
      if (response.statusCode == 200) {
        return DataApiResponsePing(response: response.bodyString ?? '');
      } else {
        throw parameters.error..message = "statusCode - ${response.statusCode}";
      }
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
