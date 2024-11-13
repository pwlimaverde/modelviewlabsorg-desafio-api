import 'package:dependencies/dependencies.dart';

import '../models/pong_response_model.dart';
import '../utils/erros.dart';
import '../utils/typedefs.dart';

final class FeaturesCorePresenter {
  static FeaturesCorePresenter? _instance;

  final CAPUsecase _consumoApiPingUsecase;
  final CARUsecase _consumoApiRandomUsecase;

  FeaturesCorePresenter._({
    required CAPUsecase consumoApiPingUsecase,
    required CARUsecase consumoApiRandomUsecase
    
  }) : _consumoApiPingUsecase = consumoApiPingUsecase, _consumoApiRandomUsecase = consumoApiRandomUsecase;

  factory FeaturesCorePresenter({
    required CAPUsecase consumoApiPingUsecase,
    required CARUsecase consumoApiRandomUsecase
    
  }) {
    _instance ??= FeaturesCorePresenter._(
      consumoApiPingUsecase: consumoApiPingUsecase,
      consumoApiRandomUsecase: consumoApiRandomUsecase
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

  Future<String> consumoApiRandom() async {
    final data = await _consumoApiRandomUsecase(
      NoParams(
        error: ApiPingError(message: "Errro ao carregar dados da API"),
      ),
    );
    Logger().d(data);
    switch (data) {
      case SuccessReturn<PasswordSchemaModel>():
        return data.result.password;
      case ErrorReturn<PasswordSchemaModel>():
        throw data.result;
    }
  }
  static FeaturesCorePresenter get to => Get.find<FeaturesCorePresenter>();
}
