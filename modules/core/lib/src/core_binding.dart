import 'package:dependencies/dependencies.dart';

import 'features/consumo_api_ping/datasource/get_connect_api_datasource.dart/api_ping_provider.dart';
import 'features/consumo_api_ping/datasource/get_connect_api_datasource.dart/consumo_api_ping_datasource.dart';
import 'features/consumo_api_ping/domain/usecase/consumo_api_ping_usecase.dart';
import 'features/consumo_api_random/datasource/get_connect_api_datasource.dart/api_ramdom_provider.dart';
import 'features/consumo_api_random/datasource/get_connect_api_datasource.dart/consumo_api_random_datasource.dart';
import 'features/consumo_api_random/domain/usecase/consumo_api_random_usecase.dart';
import 'utils/typedefs.dart';

class CoreBinding implements Binding {
  @override
  List<Bind> dependencies() => [

      ///Bindings referente a feature Consumo_api_random
        Bind.lazyPut<ApiRandomProvider>(
          () => ApiRandomProvider(
            apiEndpoint: Consts.apiEndpoint,
            apiRandom: Consts.apiRandom,
          ),
        ),
        Bind.lazyPut<CARData>(
          () => ConsumoApiRandomDatasource(
            apiProvider: Get.find<ApiRandomProvider>(),
          ),
        ),
        Bind.lazyPut<CARUsecase>(
          () => ConsumoApiRandomUsecase(
            Get.find<CARData>(),
          ),
        ),
        ///Bindings referente a feature Consumo_api_ping
        Bind.lazyPut<ApiPingProvider>(
          () => ApiPingProvider(
            apiEndpoint: Consts.apiEndpoint,
            apiPing: Consts.apiPing,
          ),
        ),
        Bind.lazyPut<CAPData>(
          () => ConsumoApiPingDatasource(
            apiProvider: Get.find<ApiPingProvider>(),
          ),
        ),
        Bind.lazyPut<CAPUsecase>(
          () => ConsumoApiPingUsecase(
            Get.find<CAPData>(),
          ),
        ),
        Bind.put<CoreController>(
          CoreController(),
        ),
        Bind.put<FeaturesCorePresenter>(
          FeaturesCorePresenter(
            consumoApiPingUsecase: Get.find<CAPUsecase>(),
            consumoApiRandomUsecase: Get.find<CARUsecase>(),
          ),
        ),
      ];
}
