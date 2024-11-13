
import 'package:dependencies/dependencies.dart';

import '../../domain/usecase/model/data_api_response_ping.dart';
import 'api_provider.dart';

///Datasources
final class ConsumoApiPingDatasource implements Datasource<DataApiResponsePing> {
  final ApiProvider apiProvider;
  ConsumoApiPingDatasource({
    required this.apiProvider,
  });
  @override
  Future<DataApiResponsePing> call(
    NoParams parameters,
  ) async {
    try {
      final response = await apiProvider.getPong();
      return DataApiResponsePing(response: response.body);
    } catch (e) {
      throw parameters.error..message = "$e";
    }
  }
}
