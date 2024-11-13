import 'package:dependencies/dependencies.dart';

import 'features/consumo_api_ping/datasource/get_connect_api_datasource.dart/api_provider.dart';
import 'features/consumo_api_ping/datasource/get_connect_api_datasource.dart/consumo_api_ping_datasource.dart';
import 'features/consumo_api_ping/domain/usecase/consumo_api_ping_usecase.dart';
import 'features/features_core_presenter.dart';
import 'utils/typedefs.dart';

class CoreBinding implements Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut<ApiProvider>(
          () => ApiProvider(
            apiEndpoint: Consts.apiEndpoint,
            apiPing: Consts.apiPing,
          ),
        ),
        Bind.lazyPut<CAPData>(
          () => ConsumoApiPingDatasource(
            apiProvider: Get.find<ApiProvider>(),
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
          ),
        ),
      ];
}
