import 'package:dependencies/dependencies.dart';

import '../models/pong_response_model.dart';
import '../utils/erros.dart';
import '../utils/typedefs.dart';

final class FeaturesCorePresenter {
  static FeaturesCorePresenter? _instance;

  final CAPUsecase _consumoApiPingUsecase;

  FeaturesCorePresenter._({
    required CAPUsecase consumoApiPingUsecase,
  }) : _consumoApiPingUsecase = consumoApiPingUsecase;

  factory FeaturesCorePresenter({
    required CAPUsecase consumoApiPingUsecase,
  }) {
    _instance ??= FeaturesCorePresenter._(
      consumoApiPingUsecase: consumoApiPingUsecase,
    );
    return _instance!;
  }

  Future<bool> consumoApiPing() async {
    final data = await _consumoApiPingUsecase(
      NoParams(
        error: ApiPingError(message: "Errro ao carregar dados da API"),
      ),
    );
    Logger().d(data);
    switch (data) {
      case SuccessReturn<PongResponseModel>():
        return true;
      case ErrorReturn<PongResponseModel>():
        throw data.result;
    }
  }

  static FeaturesCorePresenter get to => Get.find<FeaturesCorePresenter>();
}
